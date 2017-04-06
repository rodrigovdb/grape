# Why?

Use [Polymorphism with ActiveRecord](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations). Models defined like ActiveRecord documentaiton.

Also, add [Paperclip](https://github.com/thoughtbot/paperclip) to project and allow POST to resources `/pictures` upload images.

# Running

## Build

```
docker build -t grape .
```

## Run

```
$ docker run -p 8080:8080 grape
```

# Employees

## Get all

```
$ curl -X GET -s http://127.0.0.1:9393/api/v1/employees
```

## Create
```
$ curl -X POST -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/employees -d '{"name":"My name"}'
```

## Get one
```
$ curl -X GET -s http:127.0.0.1:9393/employees/1
```

## Update

```
$ curl -X PUT -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/employees/:id -d '{"name":"Jeremias"}'
```

## Delete

```
$ curl -X DELETE -s http://127.0.0.1:9393/api/v1/employees/:id
```

## Employee Pictures

### Get all pictures from an employee

```
$  curl -X GET -s http://127.0.0.1:9393/api/v1/employees/:id/pictures
```

### Add a picture to an employee

```
$ curl \
  -F "name=My image" \
  -F "image=@/path/to/image.jpg" \
  http://127.0.0.1:9393/api/v1/employees/:id/pictures
```

### Update a picture

```
$  curl -X PUT -s http://127.0.0.1:9393/api/v1/employees/:id/pictures/:picture_id -d 'name=Picture1'
```

### Delete a picture

```
$ curl -x DELETE -s http://127.0.0.1:9393/api/v1/employees/:id/pictures/:picture_id
```

# Products

## Get all

```
$ curl -X GET -s http://127.0.0.1:9393/api/v1/products
```

## Create
```
$ curl -X POST -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/products -d '{"name":"My name"}'
```

## Get one
```
$ curl -X GET -s http:127.0.0.1:9393/products/1
```

## Update

```
$ curl -X PUT -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/products/:id -d '{"name":"Jeremias"}'
```

## Delete

```
$ curl -X DELETE -s http://127.0.0.1:9393/api/v1/products/:id
```

## Product Pictures

### Get all pictures from an product

```
$  curl -X GET -s http://127.0.0.1:9393/api/v1/products/:id/pictures
```

### Add a picture to an product

```
$ curl \
  -F "name=My image" \
  -F "image=@/path/to/image.jpg" \
  http://127.0.0.1:9393/api/v1/products/:id/pictures
```

### Update a picture

```
$  curl -X PUT -s http://127.0.0.1:9393/api/v1/products/:id/pictures/:picture_id -d 'name=Picture1'
```

### Delete a picture

```
$ curl -x DELETE -s http://127.0.0.1:9393/api/v1/products/:id/pictures/:picture_id
```
