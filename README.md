# Athena

Named after the birth of athena coming from a "Splitting" headache.   Athena uses mp3split to monitor /input_music split it on silence to /output_music then delete the original file

## Installation

Using docker compose 

```docker-compose.yml
version: '3.7'

services:
    athena:
        image: markgreenway/athena:latest
        ports:
            - 80:80
        volumes:
            - input_music:/input_music
            - output_music:/output_music
        restart: always
volumes:
    input_music:
    output_music:
```
## Source Code

[github.com/hurricanepkt/athena](https://github.com/hurricanepkt/athena)


## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Thanks

## License

[MIT](https://github.com/hurricanepkt/athena/blob/main/LICENSE)

