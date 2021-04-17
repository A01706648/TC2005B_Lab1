console.log("Lab8");

//get object of fs: filesystem
const fs = require('fs');
//get the method of http object
const http = require('http');
//create server
const server = http.createServer((request, response) => {requestHandler(request, response)});

function DoAverage(array_obj)
{
    let sum = 0;
    for(let count = 0; count < array_obj.length; count ++)
    {
        sum += array_obj[count];
    }

    return (sum / (array_obj.length));
}

function WriteToFile(string_obj)
{
    fs.writeFileSync("Hello.txt", string_obj);
}

function requestHandler(request, response)
{
    //test function
    const array_obj = [1, 2, 3, 4, 5];
    console.log(DoAverage(array_obj));
    WriteToFile("Hello There");

    //server
    response.setHeader("Content-Type", "text/html");
    response.write(fs.readFileSync("../index.html"));
    response.end();
}

//listen on 3000
server.listen(3000);