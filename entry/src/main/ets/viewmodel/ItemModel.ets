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

// 购物车物品
export class CartItem{
  item: Item
  quantity: number
  styles? : number[] = []


  constructor(item: Item, quantity: number, styles?: number[]) {
    this.item = item
    this.quantity = quantity
    this.styles = styles
  }

  // 获取物品单价
  getPrice(): number{
    let price = this.item.price
    for (let index = 0; index < this.styles.length; index++) {
      price += this.item.specifications[index].data[this.styles[index]].price
    }
    return price
  }

  // 获取物品总价
  getTotalPrice(): number{
    return this.quantity * this.getPrice()
  }
}

// 订单物品
export class OrderItem{
  item: Item
  quantity: number
  payTime: string
  styles? : number[] = []


  constructor(item: Item, quantity: number, payTime: string, styles?: number[]) {
    this.item = item
    this.quantity = quantity
    this.payTime = payTime
    this.styles = styles
  }

  // 获取物品单价
  getPrice(): number{
    let price = this.item.price
    for (let index = 0; index < this.styles.length; index++) {
      price += this.item.specifications[index].data[this.styles[index]].price
    }
    return price
  }

  // 获取物品总价
  getTotalPrice(): number{
    return this.quantity * this.getPrice()
  }
}