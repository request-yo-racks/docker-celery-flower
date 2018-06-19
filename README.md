# docker-celery-flower
RYR Docker image for Flower (A Real-time Celery web-monitor)

## Usage

Using the default broker:
```bash
docker run -it --rm -p 5555:5555 ryr/celery-flower:0.9.2
```

Using a specific broker:
```bash
docker run -it --rm -e "FLOWER_BROKER_URL=redis://192.168.99.100:30558/0" -p 5555:5555  ryr/celery-flower:0.9.2
```
