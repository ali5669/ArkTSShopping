@Component
export struct AddButton{
  onClicked?: () => void

  build(){
    Row(){
      Button('加入购物车')
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
