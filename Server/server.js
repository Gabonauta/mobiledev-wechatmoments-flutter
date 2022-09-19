const express = require("express");
const app = express();
const port = 2727;
app.set("view engine", "ejs");

const users = [
  {
    nick: "Huan Huan",
    avatar:
      "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar.png",
    username: "jsmith",
    profile:
      "https://thoughtworks-mobile-2018.herokuapp.com/images/user/profile-image.jpg",
  },
];

const tweets = [
  {
    sender: {
      nick: "Cheng Yao",
      username: "cyao",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/001.jpeg",
    },
    content: "沙发！",
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/001.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/002.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/003.jpeg",
      },
    ],
    comments: [
      {
        content: "Good.",
        sender: {
          nick: "Lei Huang",
          username: "leihuang",
          avatar:
            "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/002.jpeg",
        },
      },
      {
        content: "Like it too",
        sender: {
          nick: "WeiDong Gu",
          username: "weidong",
          avatar:
            "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/003.jpeg",
        },
      },
    ],
  },
  {
    sender: {
      nick: "Xin Ge",
      username: "xinge",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/000.jpeg",
    },
  },
  {
    sender: {
      nick: "Yang Luo",
      username: "yangluo",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/004.jpeg",
    },
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/004.jpeg",
      },
    ],
  },
  {
    sender: {
      nick: "Jianing Zheng",
      username: "jianing",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/005.jpeg",
    },
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/005.jpeg",
      },
    ],
  },
  {
    error: "losted",
  },
  {
    sender: {
      nick: "Wei Fan",
      username: "weifan",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/006.jpeg",
    },
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/006.jpeg",
      },
    ],
    content:
      "Unlike many proprietary big data processing platform different, Spark is built on a unified abstract RDD, making it possible to deal with different ways consistent with large data processing scenarios, including MapReduce, Streaming, SQL, Machine Learning and Graph so on. To understand the Spark, you have to understand the RDD. ",
  },
  {
    comments: [
      {
        content: "Good.",
        sender: {
          nick: "Yanzi Li",
          username: "yanzili",
          avatar:
            "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/008.jpeg",
        },
      },
      {
        content: "Like it too",
        sender: {
          nick: "Jing Zhao",
          username: "jingzhao",
          avatar:
            "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/001.jpeg",
        },
      },
    ],
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/007.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/008.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/009.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/010.jpeg",
      },
    ],
    content: "这是第二页第一条",
    sender: {
      nick: "Xin Guo",
      username: "xinguo",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/007.jpeg",
    },
  },
  {
    sender: {
      nick: "Niang Niang",
      username: "hengzeng",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/000.jpeg",
    },
  },
  {
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/011.jpeg",
      },
    ],
    sender: {
      nick: "Jian Zhang",
      username: "jizhang",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/002.jpeg",
    },
  },
  {
    sender: {
      nick: "Yanzi Li",
      username: "yanzi",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/003.jpeg",
    },
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/012.jpeg",
      },
    ],
  },
  {
    error: "illegal",
  },
  {
    error: "WHY",
  },
  {
    error: "WOW",
  },
  {
    comments: [
      {
        content: "Good.",
        sender: {
          nick: "Cheng Yao",
          username: "cyao",
          avatar:
            "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/005.jpeg",
        },
      },
    ],
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/013.jpeg",
      },
    ],
    sender: {
      nick: "Jianing Zheng",
      username: "jianing",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/004.jpeg",
    },
    content:
      "As a programmer, we should as far as possible away from the Windows system. However, the most a professional programmer, and very difficult to bypass Windows this wretched existence but in fact very real, then how to quickly build a simple set of available windows based test environment? See Qiu Juntao's blog. ",
  },
  {
    sender: {
      nick: "Jianing Zheng",
      username: "jianing",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/006.jpeg",
    },
    content: "第9条！",
    images: [
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/014.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/015.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/016.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/016.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/017.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/018.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/019.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/020.jpeg",
      },
      {
        url: "https://thoughtworks-mobile-2018.herokuapp.com/images/tweets/021.jpeg",
      },
    ],
    comments: [],
  },
  {
    sender: {
      nick: "Xin Guo",
      username: "xinguo",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/007.jpeg",
    },
    content: "第10条！",
    comments: [],
  },
  {
    sender: {
      nick: "Yanzi Li",
      username: "yanzi",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/008.jpeg",
    },
    content: "楼下保持队形，第11条",
  },
  {
    sender: {
      nick: "Xin Guo",
      username: "xinguo",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/001.jpeg",
    },
    content: "第12条",
  },
  {
    content: "第13条",
    sender: {
      nick: "Yanzi Li",
      username: "yanzili",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/002.jpeg",
    },
  },
  {
    sender: {
      nick: "Xin Guo",
      username: "xinguo",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/003.jpeg",
    },
    content: "第14条",
  },
  {
    "unknown error": "STARCRAFT2",
  },
  {
    sender: {
      nick: "Huan Huan",
      username: "hengzeng",
      avatar:
        "https://thoughtworks-mobile-2018.herokuapp.com/images/user/avatar/004.jpeg",
    },
    content:
      "- The data json will be hosted in http://thoughtworks-ios.herokuapp.com/- Nibs or storyboards are prohibited- Implement cache mechanism by you own if needed- Unit tests is appreciated.- Functional programming is appreciated- Deployment Target should be 7.0- Utilise Git for source control, for git log is the directly evidence of the development process- Utilise GCD for multi-thread operation- Only binary, framework or cocopods dependency is allowed. do not copy other developer's source code(*.h, *.m) into your project- Keep your code clean as much as possible",
  },
];
app.get("/", (req, res) => {
  res.send("Welcome");
});
app.get("/user/:username", (req, res) => {
  const user = users.find((u) => u.username === req.params.username);

  if (!user) res.status(404).send("User not found");
  res.send(user);
});

app.get("/user/jsmith/tweets", (req, res) => {
  res.send(tweets);
});

app.listen(port, () => {
  console.log(`App listening at port ${port}`);
});
