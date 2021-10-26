npm init -y
npm i typescript 
npm install ts-node --save-dev
npm install nodemon
npx tsc -init 


package.json
"scripts": {
    "start": "node public/app.js",
    "dev" : "nodemon src/app.ts",
    "build" : "tsc -p ."

  },

  tsconfig.json

  "rootDir": "src", 
  "outDir": "public", 

   "target": "es6",                                     /* Set the JavaScript language version for emitted JavaScript and include compatible library declarations. */
     "lib": [
       "DOM","ES2017"
     ],   




     npm run dev


     npm i dotenv


     npm i typescript
     npm i @types/node
     


     