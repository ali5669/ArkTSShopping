import router from '@ohos.router'
import { LocalDataManager } from '../viewmodel/LocalDataManager'
@Entry
@Component
struct AddressPage {

  private localDataManager: LocalDataManager = LocalDataManager.instance()
  @State tempAddress: string=''
  @State testAddressList:string[]=[]
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

  aboutToAppear(){
    this.localDataManager.initUserData('wang', '123')
  }

  refresh(){
    this.testAddressList = this.localDataManager.queryUserData().addressList
  }

  build() {
    Column(){
      Text('地址列表')
        .fontWeight(FontWeight.Bold)
        .fontSize(30)
        .textAlign(TextAlign.Start)
        .width('100%')

      List(){
        ForEach(this.testAddressList,(address:string,index:number)=>{
          // ForEach(this.localDataManager.queryUserData().addressList,(address:string)=>{
          ListItem(){
            Row(){
              Column(){
                Text(address)
                  .fontSize(20)

              }
              Column(){
                Button('删除')
                  .type(ButtonType.Capsule)
                  .fontSize(20)
                  .fontColor(Color.Black)
                  .backgroundColor('#39C5BB')
                  .margin(5)
                  .onClick(()=>{
                    this.testAddressList.splice(index,1)
                  })

              }
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .height(30)
            .width('100%')
            .backgroundColor('#EFEFEF')
          }
        })
      }
      .width('95%')
      .height('80%')
      Row(){
        Text('添加地址')
          .fontWeight(FontWeight.Bold)
          .fontSize(25)
          .textAlign(TextAlign.Start)
      }
      .width('100%')
      Row(){
        TextInput({placeholder:'在这里输入你的地址'})
          .type(InputType.Normal)
          .width('70%')
          .onChange((value)=>{
            this.tempAddress=value
          })
        Button('+')
          .type(ButtonType.Circle)
          .backgroundColor('#39C5BB')
          .onClick(()=>{

            if(this.tempAddress.length<=20&&this.tempAddress.length>0){
              // this.testAddressList.push(this.tempAddress)
              this.localDataManager.insertAddress(this.tempAddress)
              this.refresh()
            }
            else{
              this.alert('输入地址过长，请重新输入！')
            }
          })
          .fontSize(20)
          .margin(5)
      }
      .height(80)

    }
  }

}