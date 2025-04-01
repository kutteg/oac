namespace: Allianz.K8s
properties:
  - deloyment.yaml: |-
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: quote-of-the-day
      spec:
        replicas: 2
        selector:
          matchLabels:
            app: quote-of-the-day
        template:
          metadata:
            labels:
              app: quote-of-the-day
          spec:
            containers:
            - name: quote-of-the-day
              image: myACRRegistry.azurecr.io/quote-of-the-day:latest
              ports:
              - containerPort: 8080
  - service.yaml: |-
      apiVersion: v1
      kind: Service
      metadata:
        name: quote-of-the-day
      spec:
        selector:
          app: quote-of-the-day
        ports:
          - protocol: TCP
            port: 80
            targetPort: 8080
        type: LoadBalancer
