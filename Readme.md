# Text-Daily
An easy way to send the daily text via push notifications using the Pushover API.

## How do I use this?
You'll need to have Ruby installed and working on your PATH.
1.The first step is to clone this repo to your local machine.
2.Get your Pushover API token(s)
3.Add your pushover API tokens to the following environment variable `SEND_LIST`
4.Setup a recurring job to run at the desired time each day which executes: `/path/to/script rake send_text`

Thats it. Have fun!