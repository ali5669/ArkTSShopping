import router from '@ohos.router'

@Entry
@Component
struct Login {
  @Styles buttonStyle(){
    .backgroundColor('#39C5BB')
    .width(75)
  }
  login:Map<string,string>=new Map()

  @State tempUsername:string=''
  @State tempPassword:string=''
  userName:string=''
  alert(alerts:string) {
    AlertDialog.show({
      message: alerts,
      autoCancel: true,
      alignment: DialogAlignment.Center,
      confirm: {
        value: '确认',
        action: () => {

        }
      }
    })
  }
  build() {
    Column() {
      Text('欢迎使用')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
      Text('ArkTSTaobao')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .margin({bottom:200})

      Row(){
        Text('手机号登录/注册')
          .fontSize(20)
      }
      .margin({bottom:10})
      Row(){
        Text('账号')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        TextInput({placeholder:'请输入注册时的账号'})
          .onChange((value)=>{
            this.tempUsername=value
          })

      }
      .margin({bottom:20})
      Row(){
        Text('密码')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
        TextInput({placeholder:'请输入密码'})
          .type(InputType.Password)
          .onChange((value)=>{
            this.tempPassword=value
          })
      }
      .margin({bottom:75})
      Row(){
        Button('注册')
          .onClick(()=>{

            if(this.tempUsername===''||this.tempPassword===''){
              this.alert('未输入账号或密码，请重新输入！')
            }
            else if(this.login.has(this.tempUsername)){
              this.alert('本账号已被注册！')
            }
            else{
              this.login.set(this.tempUsername,this.tempPassword)
              this.alert('注册成功，请登录！')
            }
          })
          .buttonStyle()
          .margin({right:25})
        Button('登录')
          .onClick(()=>{
            if(this.tempUsername===''||this.tempPassword===''){
              this.alert('未输入账号或密码，请重新输入！')
            }
            else if(!this.login.has(this.tempUsername)){
              this.alert('未注册账号，请注册！')
            }
            else if(this.tempPassword!=this.login.get(this.tempUsername)){
              this.alert('账号或密码错误，请重新输入！')
            }
            else{
              this.userName=this.tempUsername
              router.replaceUrl({
                url:'pages/GuideTabBar',
                params:{username:this.tempUsername}
              })
            }
          })
          .buttonStyle()
      }
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .margin({top:50})
  }
}