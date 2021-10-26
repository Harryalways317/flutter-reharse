import { Router } from "express";

const router = Router()

router.get("/",(req,res)=>{
    res.send({
        received : true,
        data : "Home"
    })
})

router.get("/profile",(req,res)=>{
    res.send({
        received : true,
        data : "Profile"
    })
})
router.get("/cart",(req,res)=>{
    res.send({
        received : true,
        data : "Cart"
    })
})

export {router}