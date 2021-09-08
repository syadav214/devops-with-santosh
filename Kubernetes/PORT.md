
how port are related:

`nodePort` -> `port` -> `targetPort`

`services.yaml` ->
Say your host machine ip is 10.10.20.20 you can hit the http, metrics, health services by 10.10.20.20:30475, 10.10.20.20:31261, 10.10.20.20:30013.