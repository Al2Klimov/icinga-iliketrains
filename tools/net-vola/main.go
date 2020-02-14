package main

import (
	log "github.com/sirupsen/logrus"
	"math/rand"
	"os"
	"os/exec"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	log.SetOutput(os.Stdout)
	log.SetFormatter(&log.JSONFormatter{})
	log.SetLevel(log.TraceLevel)

	ch := make(chan os.Signal, 1)
	on := false

	signal.Notify(ch, syscall.SIGTERM, syscall.SIGINT)

	defer turnOff(&on)

	for {
		select {
		case sig := <-ch:
			log.WithFields(log.Fields{"signal": sig}).Info("Terminating")
			return
		case <-sleep(rand.Float64()*9 + 1).C:
		}

		if !iptables(&on) {
			return
		}

		select {
		case sig := <-ch:
			log.WithFields(log.Fields{"signal": sig}).Info("Terminating")
			return
		case <-sleep(rand.Float64()*4 + 1).C:
		}

		if !iptables(&on) {
			return
		}
	}
}

func sleep(secs float64) *time.Timer {
	log.WithFields(log.Fields{"seconds": secs}).Debug("Sleeping")

	return time.NewTimer(time.Duration(secs * float64(time.Second)))
}

func turnOff(on *bool) {
	if *on {
		iptables(on)
	}
}

var onOff = map[bool]string{
	false: "-D",
	true:  "-I",
}

func iptables(on *bool) bool {
	*on = !*on

	for _, io := range [2]string{"INPUT", "OUTPUT"} {
		cmd := exec.Command("iptables", onOff[*on], io, "-p", "tcp", "-m", "tcp", "--dport", "5665", "-j", "DROP")
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		cmd.Dir = "/"

		log.WithFields(log.Fields{"args": cmd.Args}).Info("Running iptables")

		if errRn := cmd.Run(); errRn != nil {
			log.WithFields(log.Fields{"args": cmd.Args, "error": errRn.Error()}).Error("Couldn't run iptables")
			return false
		}
	}

	return true
}
