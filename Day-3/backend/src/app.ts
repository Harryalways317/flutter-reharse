import express from "express";
import dotenv from "dotenv"
import { router } from "./routes/routes";

dotenv.config()
const app = express()
const port = process.env.PORT;
app.set("port",port)

app.use("/",router);
app.use("/user",router);
app.use("/auth",router);
app.use("/home",router);

app.listen(app.get("port"),()=> {
    console.log(`Server is in ${port}`)
})

