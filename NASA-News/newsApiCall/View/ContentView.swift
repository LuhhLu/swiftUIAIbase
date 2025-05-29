// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.articles) { article in
                    VStack(alignment: .leading, spacing: 12) {
                        // 异步加载封面图
                        AsyncImage(url: article.imageUrl) { img in
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                                .frame(height: 200)
                        }
                        
                        // 文章信息
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(article.newsSite)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(article.publishedAt, style: .date)
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                            
                            Text(article.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text(article.summary)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                            
                            Link("Read more", destination: article.url)
                                .font(.footnote)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Spaceflight News")
            .listStyle(.insetGrouped)
            .task {
                vm.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

