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
    ]
  }
]
