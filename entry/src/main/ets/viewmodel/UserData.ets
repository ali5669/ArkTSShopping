export class UserData{
  username:string = ''
  password:string = ''
  addressList?:string[] = []

  constructor(username: string, password: string) {
    this.username = username
    this.password = password
  }
}