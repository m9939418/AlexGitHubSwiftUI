//
// UserListView.swift
// AlexGitHubSwiftUI
//
// Created by AlexYang on 2024/12/30.
//


import SwiftUI
import Kingfisher

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                List(viewModel.users ?? [], id: \.id) { user in
                    
                    HStack {
                        //                    AsyncImage(url: URL(string:user.avatarURL ?? "")) { image in
                        //                        image
                        //                            .resizable()
                        //                            .aspectRatio(contentMode: .fit)
                        //                            .clipShape(Circle())
                        //                    } placeholder: {
                        //                        Circle()
                        //                            .foregroundColor(.red)
                        //                    }
                        KFImage(URL(string: user.avatarURL ?? ""))
                            .placeholder{
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                            }
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(user.login ?? "")
                                .font(.headline)
                            
                            Text(user.url ?? "")
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Users")
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .red))
                }
            }
        }
        .task {
            await viewModel.fetchUsers()
        }
        .alert(isPresented: $viewModel.isShowError, content: {
            return Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}

#Preview {
    UserListView()
}
