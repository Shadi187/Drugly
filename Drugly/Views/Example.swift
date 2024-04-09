import SwiftUI


struct NewCard1: View {
//    @StateObject var vm = NewCardViewModel()
//    let strokeColor:Color
//    let drug:Medic
    var body: some View {
        ZStack(alignment:.leading){
            
            HStack{
            
                    Image("Paracetamol")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius:12))
                        .frame(width:100,height:80)
            
//                Spacer()
            VStack(alignment:.leading){
                
                Text("drug.gen_name")
//                    .foregroundStyle(Color("FontColor"))
                    .foregroundStyle(Color.black)
                    .font(.title)
                
                Text("drug.tr_name")
                    .foregroundStyle(Color.black)
                    .font(.headline)
                
                Text("drug")
                    .foregroundStyle(Color.black)
                    .font(.subheadline)
                
            
            }
                Spacer()
            
        }
            .padding()
        }
    }
}

#Preview {
  NewCard1()
}
