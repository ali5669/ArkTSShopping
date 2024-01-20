import {Item, ShowItem} from '../../datatype/Item'

@Extend(Button) function chooseButton(){
  .backgroundColor(Color.White)
  .borderWidth(1)
  .borderColor(Color.Red)
}

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

  // TODO: 优化这坨屎
  build(){
    if(this.chooseItem == this.item){
      Button(){
        Row(){
          Image(this.item.image)
            .width(50)
            .margin({right: 5})
          Text(this.item.name)
            .fontSize(24)
        }
      }
      .chooseButton()
      .type(ButtonType.Normal)
      .onClick(()=>{
        this.chooseItem = this.item
      })
    }
    else{
      Button(){
        Row(){
          Image(this.item.image)
            .width(50)
            .margin({right: 5})
          Text(this.item.name)
            .fontSize(24)
        }
      }
      .backgroundColor('#e0e0e0')
      .type(ButtonType.Normal)
      .onClick(()=>{
        this.chooseItem = this.item
      })
    }
  }
}