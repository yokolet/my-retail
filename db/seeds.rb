data = [
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

data.each do |h|
    Ext::Api::V1::Product.create(pid: h[:pid], name: h[:name])
end
