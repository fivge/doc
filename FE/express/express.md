### 

### basic

### http

### ws

```json
  "dependencies": {
    "ws": "^6.0.0"
  }
```

```typescript
import { Server } from "ws";

const wsServer = new Server({ port: 8085 });

wsServer.on("connection", websocket => {
  console.log(`WebSocket server listening on port 8085`);
  websocket.send("This is send by wsserver");
  websocket.on("message", message => {
    console.log(`get message form angular,message is: ${message}`);
  });
});

let times: number = 0;

setInterval(() => {
  if (wsServer.clients) {
    let num: number = 0;
    wsServer.clients.forEach(element => {
      element.send(
        `Timeout is 20000, from server You are NO${num}, has ${times}times`
      );
      num++;
      times++;
    });
  }
}, 20000);
```



### assets

### 模板渲染













### with ts

