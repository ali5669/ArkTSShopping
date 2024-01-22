import {Item, ShowItem} from '../../datatype/Item'

@Component
export struct TypeChooseList{
  showItem: ShowItem

  build(){
    List({space: 10}){
      ForEach(
        this.showItem.itemType,
        (item: Item, index) => {
          ListItem(){
            ItemCard({item: item})
          }
        }
      )
    }
    .layoutWeight(1)
  }
}

@Component
struct ItemCard{
  @ObjectLink
  item: Item
  @Consume chooseItem: Item

  build(){
    Row(){
      Image(this.item.image)
        .width(50)
        .margin({right: 5})
      Text(this.item.name)
        .fontSize(24)
    }
    .backgroundColor(this.item == this.chooseItem? '#FFFFFF': '#e0e0e0')
    .borderWidth(this.item == this.chooseItem? 1: 0)
    .borderColor(Color.Red)
    .onClick(()=>{
      this.chooseItem = this.item
    })
  }
}