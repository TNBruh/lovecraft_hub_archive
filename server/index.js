const Hapi = require('@hapi/hapi');
const target = require('./data');
require("dotenv").config();

let l = {};
target.forEach((item) => {
    l[item] = 0;
});

const init = async () => {
  
  const server = Hapi.server({
    port: 1337,
    host: process.env.HOST,
    routes: {
      cors: true
    }
  });


  server.route([
    {
        method: 'POST',
        path: '/read',
        handler: (request, h) => {
            const payload = request.payload;

            const entry = payload.entry;
            // console.log(entry);
            // console.log(entry in l);

            if (entry in l) {
                l[entry] += 1;
                return {status: 200, message: "success"};
            }

            return {status: 400, message: "sus"};
        }
    },
    {
        method: 'GET',
        path: '/read',
        handler: (request, h) => {
            return l;
        }
    }
])
 
  await server.start();
  console.log(`among us ${server.info.uri}`);
};

let d = new Date();

let nextDay = (d.getDay() + 1) % 7;

console.log(d.getDay());
console.log(nextDay);



async function loop() {
    while (true) {
        await new Promise(r => setTimeout(r, 1000));
        let currentDay = d.getDay();
        // console.log(l);

        if (currentDay < nextDay) continue;
        console.log("updating");
        Object.keys(l).forEach((item) => {
            l[item] = 0;
        });
        nextDay = (d.getDay() + 1) % 7;
        // setTimeout(() => {
        //     console.log(currentDay);
        // }, 1000);
    }
}

loop();
init();
 
console.log('######################');
console.log(l);