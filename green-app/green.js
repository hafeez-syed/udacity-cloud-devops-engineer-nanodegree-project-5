const express = require("express");
const app = express();
const PORT = 4000;
let path = require("path");
path = path.join(__dirname, 'public');

app.use(express.static(path));
app.get("/", (req, res) => {
    res.sendFile(`${path}/green.html`);
});

app.listen(PORT, function () {
    console.log(`listening on ${PORT}`);
});    
