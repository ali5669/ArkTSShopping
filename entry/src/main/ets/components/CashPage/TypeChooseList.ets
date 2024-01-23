import { Item, Specification, ItemStyle } from '../../viewmodel/ItemModel'

@Component
export struct TypeChooseList{
  item: Item
  @State currentIndices: number[] = []
  @Consume finalPrice: number

  onStylesChanged: (currentStyles: number[]) => void
  aboutToAppear(){
    for (let index = 0; index < this.item.specifications.length; index++) {
      this.currentIndices.push(0)
    }
  }

  build(){
    List({space: 10}){
      ForEach(
        this.item.specifications,
        (spec: Specification, index) => {
          ListItem(){
            this.SpecList(spec, index)
          }
        }
      )
    }
    .layoutWeight(1)
  }

  @Builder SpecList(spec: Specification, specIndex: number){
    List({space: 10}){
      ForEach(
        spec.data,
        (style: ItemStyle, index) => {
          ListItem(){
            ItemCard({
              specIndex: specIndex,
              index: index,
              style: style,
              onClicked: () => this.updateCurrentIndex(specIndex, index),
              currentIndices: $currentIndices
            })
          }
        }
      )
    }
    .layoutWeight(1)
    .listDirection(Axis.Horizontal)
  }

  // 每次点击事件发生时，重新计算价格
  updateCurrentIndex(specIndex: number, currentIndex: number){
    this.currentIndices[specIndex] = currentIndex
    this.finalPrice = this.item.price
    for (let index = 0; index < this.item.specifications.length; index++) {
      this.finalPrice += this.item.specifications[index].data[this.currentIndices[index]].price
    }
    this.onStylesChanged(this.currentIndices)
  }
}

@Component
struct ItemCard{
  private specIndex: number
  private index: number
  private style: ItemStyle
  @Link currentIndices: number[]

  onClicked?: () => void

  build(){
    Row(){
      Image(this.style.image)
        .width(50)
        .margin({right: 5})
      Text(this.style.title)
        .fontSize(24)
    }
    .backgroundColor(this.currentIndices[this.specIndex] == this.index ? '#FFFFFF' : '#e0e0e0')
    .borderColor(this.currentIndices[this.specIndex] == this.index ? Color.Red : '#e0e0e0')
    .borderWidth(2)
    .onClick(() => this.onCardClick())
  }

  onCardClick(){
    if(this.onClicked){
      this.onClicked()
    }
  }
}

