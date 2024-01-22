@Component
export struct AddButton{
  build(){
    Row(){
      Button('加入购物车')
        .width('90%')
        .onClick(()=>{

        })
    }
    .padding({bottom: 10})
    .justifyContent(FlexAlign.Center)
  }
}
