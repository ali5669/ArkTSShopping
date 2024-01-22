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
          {title: '样式1', price: 15.5, image: ''},
          {title: '样式2', price: 25, image: ''},
          {title: '样式3', price: 35, image: ''}
        ]
      }
    ]
  }
]
