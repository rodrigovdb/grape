# Build

```
docker build -t grape .
```

# Run

```
$ docker run -p 8080:8080 grape
```

# Get all

```
$ curl -X GET -s http://127.0.0.1:9393/api/employees
```

# Create
```
$ curl -X POST -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/employees -d '{"name":"My name"}'
```

# Get one
```
$ curl -X GET -s http:127.0.0.1:9393/employees/1
```

# Update

```
$ curl -X PUT -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/employees/3 -d '{"name":"Jeremias"}'
```

# Get all pictures from an employee

```
$  curl -X GET -s http://127.0.0.1:9393/api/employees/1/pictures
```

# Add a picture to an employee

```
$  curl -X PUT -s http://127.0.0.1:9393/api/employees/1/pictures -d 'name=Picture1'
```
