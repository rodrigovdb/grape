require './lib/loader'

if Employee.count == 0
  3.times do |i|
    e = Employee.new(name: "Colaborador #{i}")
    e.pictures << Picture.new(name: "Imagem #{i}", image: File.new('./samples/test.jpg'))
    e.save
  end
end

#if Product.count == 0
  6.times do |i|
    p = Product.new(name: "Produto #{i}")
    p.pictures << Picture.new(name: "Imagem #{i}", image: File.new('./samples/test.jpg'))
    p.save
  end
#end
