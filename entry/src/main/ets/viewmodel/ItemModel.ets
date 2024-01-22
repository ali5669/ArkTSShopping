// 不同的样式
export class KV {
  title: string = '';
  image?: string = ''
}

// 样式种类
export class Specification {
  title: string = '';
  data: KV[] = [];
}

// 物品
export class Item{
  id: string = ''
  title: string = ''
  image: ResourceStr = ''
  price: number = 0
  specifications? :Specification[] = []
}

