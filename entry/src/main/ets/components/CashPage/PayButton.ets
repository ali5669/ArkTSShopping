@Component
export struct PayButton{
  @Prop quantity: number
  @Consume finalPrice: number

  onClicked?: () => void

  build(){
    Row(){
      Button(`支付 ￥${this.finalPrice * this.quantity}`)
        .width('90%')
        .onClick(()=>{this.onButtonClicked()})
    }
    .padding({bottom: 10})
    .justifyContent(FlexAlign.Center)
  }

  onButtonClicked(){
    if(this.onClicked){
      this.onClicked()
    }
  }
}
