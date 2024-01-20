@Observed
export class Item{
  name: string
  image: ResourceStr
  price: number

  constructor(name: string, image: ResourceStr, price: number) {
    this.name = name
    this.image = image
    this.price = price
  }
}

export class ShowItem{
  item: Item
  itemType: Item[]

  constructor(item: Item, itemType: Item[]) {
    this.item = item
    this.itemType = itemType
  }
}

