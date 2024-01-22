// 不同的样式
export class ItemStyle {
  title: string = ''
  price: number = 0
  image?: ResourceStr = ''
}

// 样式种类
export class Specification {
  title: string = '';
  data: ItemStyle[] = [];
}

// 物品
export class Item{
  id: string = ''
  title: string = ''
  image: ResourceStr = ''
  price: number = 0
  specifications? :Specification[] = []
  reviews?:String[]=[]
}

