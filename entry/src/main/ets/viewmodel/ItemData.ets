import {Item} from './ItemModel'
export const ItemData: Item[] = [
  {
    id: '1',
    title: '抽纸',
    image: $r('app.media.paper'),
    price: 15.5,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 0, image: $r('app.media.paper')},
          {title: '样式2', price: 10, image: $r('app.media.paper')},
          {title: '样式3', price: 20, image: $r('app.media.paper')}
        ]
      },
      { title: '品质',
        data: [
          {title: '品质1', price: 0, image: $r('app.media.paper')},
          {title: '品质2', price: 10, image: $r('app.media.paper')},
          {title: '品质3', price: 20, image: $r('app.media.paper')}
        ]
      }
    ],
    reviews:[
      '好好好',
      '不好','好用，很省事，','质量一如既往的好，物流一如既往的快。','每包的数量与商品宣传不一样，每包都少十几抽。','宝贝收到，货品齐全，店家认真负责，热情周到，快递给力，满意好评。','好好好','好好好','好好好','好好好','好好好','好好好','好好好','好好好','好好好','好好好',
    ]
  },
  {
    id: '2',
    title: '华为Mate60',
    image: $r('app.media.mate60'),
    price: 6999,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['不是华为我不用，因为他是有良心的中国制造',
      '遥遥领先，遥遥领先，操控一流，手机拿起来也舒服，轻薄，大气！还有好多新功能慢慢了解，拍照也一流，国产手机yyds，为技术买单，没毛病',
      '手机收到了，物流很快，第二天就送到了，不亏是国名大品牌，果然是遥遥领先，屏幕分辨率很清晰，拍照效果也更好，很不错的一款手机！',
      '遥遥领先！遥遥领先！遥遥领先！哈！抱歉！前天就收到货了。奈何这几天上夜班没空评价！说真的这么贵的手机物流包装有点简陋！建议商家发顺丰哈。手机用上了。充电超级快，真的很好用！虽然有点贵。但是值得。信赖京东。手机非常好用。物超所值！一直用华为。从mate10pro到今天的60pro！支持国产！！！五星好评。'
    ]
  },
  {
    id: '3',
    title: 'MateBookProX',
    image: $r('app.media.mateBookProX'),
    price: 13999,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['华为遥遥领先电脑，跟华为手机匹配度超级高，颜值超赞，超薄超轻，品质非常可，日常办公很合适，运行速度也不错，国货蒸蒸日上，加油！',
    '快递速度非常快，上午下单，下午就送到了，包装很严实，也很安全，整体是不错的，暂时还没有拆开，但是电脑应该是不错的，整体非常满意',
    '心心念念的华为本终于到货了，包装完美，极速送货。打开后手感很好，灰色有科技感，运行速度快，声音和屏幕颜色都很满意，周边配件也很简单。好得很！',
    '产品质量很好，外观很漂亮，运行速度很快，品牌很值得信赖，屏幕看着很舒服，性价比很高，在搞活动的时候比其他地方便宜很多，在京东上买比较放心，快递速度真的是快，当天买当天到！'
  ]
  },
  {
    id: '4',
    title: 'WatchGT4',
    image: $r('app.media.watchGT4'),
    price: 1438,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['华为这款手表还是不错的，本是买来跑步用，佩戴后发现日常也非常适合。续航能力OK的一星期左右充一次，跑步数据准确，表盘图案可以每天不同样，手表质感很好 。',
      '外观高端大气上档次。 续航时间长。功能很强大。 跑步锻炼的必备。 操作简单。灵敏度高。 发货速度快。 再说一句 遥遥领先',
      '买了三块gt4了，每款都很漂亮，功能都很实用，送给家里人非常好的选择，gt4搭载全新的鸿蒙系统，使用起来非常流畅，待机时间长达半个月之久，心律检测功能让安全更有保障，皮质表带质感很好'
    ]
  },
  {
    id: '5',
    title: 'FreeBuds Pro3',
    image: $r('app.media.freeBudsPro3'),
    price: 14999,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['第一次佩戴华为耳机，重量轻、造型好看，长时间佩戴没有不适的感觉，也不容易掉，尤其是静谧效果非常好，飞行途中听听音乐，不用再忍受飞机噪音。龙年典藏版，画龙点睛是神来之笔。',
      '华为的产品真的爱了 这个龙年限定版 很有质感 弹窗也与众不同 星闪技术非常牛 完全没有延迟 声音质感超级棒 搭配我的mate60 真的绝',
      '一直没抢到mate60pro，想体验一下麒麟芯片，所以买了这个freebudspro3，去实体店体验过后恋恋不舍，所以在双十一下单了，音质很好。连接小米手机很快，两个月后mate手机到了以后，联合智慧生活设置头部跟踪，真是厉害了！我可能比较喜欢半入耳式的，这种入耳式的适应了几天才习惯。电池仓支持无线充电。连接了华为手机放在无线充电器上才有叮的一声，哈哈。总体体验好评！'
    ]
  },
  {
    id: '6',
    title: 'Mate X5',
    image: $r('app.media.mateX5'),
    price: 12999,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['包装用心，收到时候发现质量出乎意料的好，满满的高级感，因为送人不好打开，哈哈，现在推荐给了朋友，好东西要一起分享！',
      '手机手感很好，屏幕清晰度也很好，就是感觉用一会手机还是有点发热，希望系统更新后能够改善，总体来说华为手机还是遥遥领先的',
      '很好看，制作工艺很精美，材质也很好！给个赞！到货就迫不及待打开了，果真没有让我失望，质量特别好，颜值也相当高，满意的一次购物',
      '的确是全新国行未激活手机，手感用着非常好，支持华为！'
    ]
  },
  {
    id: '7',
    title: 'RX 580',
    image:($r('app.media.11265_14_RX580_NITRO_plus_OC_8GB_800x500_01_C')),
    price: 200,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['金手指痕迹明显，其它的比较干净。性价比还是比较高的。风扇还可以没有啸音。安装很方便卡口螺丝口都对的很正。驱动直接网上搜的公版。玩儿了一天一夜，一个网游命运2，一个孤岛惊魂6暂时没有问题。后续如果翻车再评论吧，希望不要有事，来回寄着麻烦。',
      '一次点亮，跑分不高不低，性价比高，除了风扇噪音大没什么大毛病，翻车的话再追评',
      '看看样子pcb甚至是新的，最后一张图能看出甚至有显存导热片，重量质感这个价格完全是巴巴适适',
      '整体评价：这价格买个服务 性价比：高！ 散热效果：甜甜圈85，峰值88，一般般 安装情况：一次点亮 运行速度：鲁大师16万多好像，跑完就删了！'
    ]
  },
  {
    id: '8',
    title: '1080Ti',
    image: $r('app.media.1080ti'),
    price: 999,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:[]
  },
  {
    id: '9',
    title: '吹雪Z690-A',
    image: ($r('app.media.h525')),
    price: 2499,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ],
    reviews:['吹雪姬嘶哈嘶哈',
      '中端主板，主打白色的颜值，但是性能就一般般了，做工中规中矩吧。',
      '此用户未填写评价内容',
      '主板很给力，吹雪的颜值没得说']
  },
  {
    id: '10',
    title: 'Arona',
    image: ($r('app.media.arona')),
    price: 19999,
    specifications: [
      { title: '样式',
        data: [
          {title: '纯净版', price: 15.5, image: ''},
          {title: '加强版', price: 25, image: ''},
          {title: '黑化版(Purana)', price: 35, image: 'https://cdnimg.gamekee.com/wiki2.0/images/w_200/h_200/829/43637/2023/1/27/874146.png'}
        ]
      }
    ],
    reviews:['蓝色恶魔','彩奈最可爱😊😊😊嘿嘿嘿','草莓牛奶可爱滴捏','不听话的Arona已经不需要了','好有感觉，不想要蓝色恶魔力']
  },
  {
    id: '11',
    title: '龙图印章',
    image: $r('app.media.longtu'),
    price: 8,
    specifications: [
      { title: '样式',
        data: [
          {title: '样式1', price: 1, image: ''},
          {title: '样式2', price: 2, image: ''},
          {title: '样式3', price: 3, image: ''}
        ]
      }
    ],
    reviews:['款式风格：确实挺不错的','非常好，喜欢，这很龙','不会画就买了印章，四个字:好玩爱玩',
      '个商品的品质卓越，无论是从设计、材质还是功能上，都展现出了极高的水准。它不仅能满足我们的基本需求，更能带给我们超乎想象的使用体验。'
    ]
  },

]
