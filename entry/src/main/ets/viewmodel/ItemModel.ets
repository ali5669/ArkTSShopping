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
}

// 购物车物品
@Observed
export class UserItem{
  item: Item
  quantity: number = 0
  styles: number[] = []

  constructor(item: Item, quantity: number, styles: number[]) {
    this.item = item
    this.quantity = quantity
    this.styles = styles
  }
}
