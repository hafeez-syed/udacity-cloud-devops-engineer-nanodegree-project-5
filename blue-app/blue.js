const express = require("express");
const app = express();
const PORT = 3000;
let path = require("path");
path = path.join(__dirname, 'public');

app.use(express.static(path));
app.get("/", (req, res) => {
    res.sendFile(`${path}/blue.html`);
});

app.listen(PORT, function () {
    console.log(`listening on ${PORT}`);
});    
