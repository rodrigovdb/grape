# Why?

Use [Polymorphism with ActiveRecord](http://guides.rubyonrails.org/association_basics.html#polymorphic-associations). Models defined like ActiveRecord documentaiton.

Also, add [Paperclip](https://github.com/thoughtbot/paperclip) to project and allow POST to resources `/pictures` upload images.

Also, provides an authentication engine with access token.

# Running

## Build

```
docker build -t grape .
```

## Run

```
$ docker run -p 8080:8080 grape
```

# Authenticate

## Getting a token

```
$ curl -X POST -s http://127.0.0.1:9393/api/auth -d "public_key=7e766fffb587afd6bfd73dd73cce4330&password=MyPassword12"
```

# Employees

## Get all

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X GET -s http://127.0.0.1:9393/api/v1/employees
```

## Create
```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X POST -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/employees -d '{"name":"My name"}'
```

## Get one
```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X GET -s http:127.0.0.1:9393/employees/1
```

## Update

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X PUT -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/employees/:id -d '{"name":"Jeremias"}'
```

## Delete

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X DELETE -s http://127.0.0.1:9393/api/v1/employees/:id
```

## Employee Pictures

### Get all pictures from an employee

```
$  curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X GET -s http://127.0.0.1:9393/api/v1/employees/:id/pictures
```

### Add a picture to an employee

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 \
  -F "name=My image" \
  -F "image=@/path/to/image.jpg" \
  http://127.0.0.1:9393/api/v1/employees/:id/pictures
```

### Update a picture

```
$  curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X PUT -s http://127.0.0.1:9393/api/v1/employees/:id/pictures/:picture_id -d 'name=Picture1'
```

### Delete a picture

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -x DELETE -s http://127.0.0.1:9393/api/v1/employees/:id/pictures/:picture_id
```

# Products

## Get all

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X GET -s http://127.0.0.1:9393/api/v1/products
```

## Create
```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X POST -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/products -d '{"name":"My name"}'
```

## Get one
```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X GET -s http:127.0.0.1:9393/products/1
```

## Update

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X PUT -H "Content-Type: application/json" -s http://127.0.0.1:9393/api/v1/products/:id -d '{"name":"Jeremias"}'
```

## Delete

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X DELETE -s http://127.0.0.1:9393/api/v1/products/:id
```

## Product Pictures

### Get all pictures from an product

```
$  curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X GET -s http://127.0.0.1:9393/api/v1/products/:id/pictures
```

### Add a picture to an product

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 \
  -F "name=My image" \
  -F "image=@/path/to/image.jpg" \
  http://127.0.0.1:9393/api/v1/products/:id/pictures
```

### Update a picture

```
$  curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -X PUT -s http://127.0.0.1:9393/api/v1/products/:id/pictures/:picture_id -d 'name=Picture1'
```

### Delete a picture

```
$ curl -H XAuthToken:90f228e9d9f9ab7b4d996c0cd5c74ca6 -x DELETE -s http://127.0.0.1:9393/api/v1/products/:id/pictures/:picture_id
```
