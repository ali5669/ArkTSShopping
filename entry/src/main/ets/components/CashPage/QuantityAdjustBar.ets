@Component
export struct QuantityAdjustBar {
  @Link quantity: number

  build() {
    Row(){
      Button('-')
        .buttonStyle()
        .onClick(()=>{
          if(this.quantity > 1){
            this.quantity -= 1
          }
        })

      TextInput({text: this.quantity.toFixed(0)})
        .width(60)
        .backgroundColor(Color.White)
        .borderWidth(1)
        .textAlign(TextAlign.Center)
        .type(InputType.Number)
        .onChange(value => {
          this.quantity = parseInt(value) | 0
        })

      Button('+')
        .buttonStyle()
        .onClick(()=>{
          this.quantity += 1
        })
    }
  }
}

@Extend(Button) function buttonStyle(){
  .fontSize(32)
  .borderWidth(1)
  .borderColor(Color.Gray)
  .backgroundColor(Color.White)
  .fontColor(Color.Black)
}