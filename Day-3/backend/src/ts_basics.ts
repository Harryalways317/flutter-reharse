console.log("Harryalways317")
const a: number = 5  //constatnt
var b: string = 'Harry' //global scope
let c: string = "Hello There" //local scope
var loggedin : boolean = true;

let subjects : string[] = ["phy","mat","chem"]

let userHabits : string[];
userHabits = ["Singing","Dancing"]
userHabits.push("Swimming")
console.log(userHabits)

//tuples with dtype
let veggies : [string,number]
veggies = ["har", 49]

//array of tuples
let listofVeggies : [string,number][]
listofVeggies = [["har", 49],["har", 49],["har", 49],["har", 49]]


//maps
var inner : Map<number,string> = new Map()
inner.set(22,"panda")
inner.set(12,"1panda")
inner.set(32,"2panda")

for(let val of inner.keys()){
    console.log(val)
}

 inner.forEach((value)=> console.log(value));

 let decideMyType : number | string | boolean ;
 decideMyType = true;
 decideMyType = 55;

 let car : any ;
 car = 34;

//user defined type
 type  Uid = number | string;
 var userId : Uid = 5;
 console.log(typeof userId)

 //type assertions and functions
 function SaymyName(x : string): string{
    return x;
 }
//Function Inside Function
 function identifyMe(x : string){
    function SaymyName1(x : string , y? : number): string{
        console.log(y);
        return x;
     }
     if(x == "Harry"){
         console.log("Identified")
         console.log(SaymyName1("2"))

     }else{
         console.log("Not Identified")
     }
 }
 identifyMe(SaymyName("Harry"));



 class Car{
     model : string
     engine : string

     constructor(model : string , engine : string){
         this.engine = engine
         this.model = model
     }


     carData(){
         return `car model ${this.model} has enginr ${this.engine}`
     }
}
const car1 = new Car("Audi","V8")
console.log(car1.carData())


//Interfaces
interface UserData {
    userName : string,
    userPassword : string
}
const user1 : UserData = {
    userName : "harry",
    userPassword : "Harry"
}