import http from "http";
http.createServer(function(req,res){
    res.writeHead(200,{
        "Context-Type": "text/html"
    })
    res.write(req.url)
  res.end()
}).listen(8000)