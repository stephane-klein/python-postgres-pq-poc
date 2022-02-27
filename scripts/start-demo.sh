#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

unset TMUX
tmux new-session -s demo -d
sleep 0.2
tmux send-keys -t demo 'docker compose up -d' C-m
sleep 0.2
tmux send-keys -t demo 'poetry run ./server.py' C-m

tmux split-window -v -t demo -l 75%
sleep 0.2
tmux send-keys -t demo 'poetry run ./server.py' C-m

tmux split-window -v -t demo -l 66%
sleep 0.2
tmux send-keys -t demo 'poetry run ./create-a-job.py'

tmux split-window -v -t demo -l 50%
sleep 0.2
tmux send-keys -t demo './scripts/enter-in-pg.sh' C-m
sleep 0.2
tmux send-keys -t demo "INSERT INTO queue (q_name, data) VALUES('queue1', '{\"foo\": \"bar2\"}')\;"

tmux select-pane -t demo -U

tmux attach -t demo

