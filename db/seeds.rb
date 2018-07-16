products = [
    {pid: 25608601, name: "4-LOM"},
    {pid: 53160687, name: "BB-8"},
    {pid: 46953386, name: "Interrogation Droid"},
    {pid: 10619648, name: "R2-D2"},
    {pid: 15053343, name: "BB-9E"},
    {pid: 90102265, name: "Super Battle Droid"},
    {pid: 26138797, name: "K-2SO"},
    {pid: 68476510, name: "Buzz Droid"},
    {pid: 44400669, name: "C-3PO"},
    {pid: 61052544, name: "Droideka"}
]

current_prices = [
    {pid: 25608601, value: 8.99, currency_code: "USD"},
    {pid: 53160687, value: 65.49, currency_code: "USD"},
    {pid: 46953386, value: 1139, currency_code: "JPY"},
    {pid: 10619648, value: 4500, currency_code: "JPY"},
    {pid: 15053343, value: 6.00, currency_code: "CAD"},
    {pid: 90102265, value: 106.92, currency_code: "MXN"},
    {pid: 26138797, value: 92.20, currency_code: "CAD"},
    {pid: 68476510, value: 178.25, currency_code: "MXN"},
    {pid: 44400669, value: 83.38, currency_code: "EUR"},
    {pid: 61052544, value: 4.17, currency_code: "EUR"}
]

products.each do |h|
    Ext::Api::V1::Product.create(pid: h[:pid], name: h[:name])
end

current_prices.each do |h|
  puts "h: #{h}"
    Api::V1::CurrentPrice.create(pid: h[:pid], value: h[:value], currency_code: h[:currency_code])
end
