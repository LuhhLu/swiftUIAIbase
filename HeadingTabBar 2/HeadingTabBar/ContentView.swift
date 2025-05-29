 

import SwiftUI

struct ContentView: View {
    let scrollViewTopPadding: CGFloat
    let scrollContentTopPadding: CGFloat
    @Binding var scrollOffset: CGFloat
    @Binding var selectedSection: Sections
    @Binding var scrollTo: Sections?
    
    @State var allSections = Sections.allCases
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment:.leading,spacing: 24) {
                    generalSection
                        .onScrollVisibilityChange(threshold: 0.2) { isVisible in
                            select(.general, when: isVisible)
                        }
                    
                    servicesSection
                        .onScrollVisibilityChange(threshold: 0.2) { isVisible in
                            select(.services, when: isVisible)
                        }
                    
                    facilitiesSection
                        .onScrollVisibilityChange(threshold: 0.2) { isVisible in
                            select(.facilities, when: isVisible)
                        }
                    
                    reviewsSection
                        .onScrollVisibilityChange(threshold: 0.2) { isVisible in
                            select(.reviews, when: isVisible)
                        }
                    
                    buySection
                        .onScrollVisibilityChange(threshold: 0.2) { isVisible in
                            select(.buy, when: isVisible)
                        }
                    
                    aboutSection
                        .onScrollVisibilityChange(threshold: 0.2) { isVisible in
                            select(.about, when: isVisible)
                        }
                        .padding(.bottom, 600)
                }
                .padding(.horizontal)
                .padding(.top, scrollContentTopPadding)
            }
            .scrollIndicators(.hidden)
            .padding(.top, scrollViewTopPadding)
            .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
                geometry.contentOffset.y
            }, action: { _, newValue in
                scrollOffset = newValue
            })
            .onChange(of: scrollTo) { _, newValue in
                guard let newValue else { return }
                scrollTo = nil
                
                guard let index = Sections.allCases.firstIndex(where: { $0 == newValue }) else { return }
                allSections = Array(Sections.allCases[index...])
                
                withAnimation {
                    selectedSection = newValue
                    
                    if newValue == .general {
                        proxy.scrollTo(newValue, anchor: .init(x: 0, y: 0.2))
                    } else {
                        proxy.scrollTo(newValue, anchor: .init(x: 0, y: 0.015))
                    }
                }
            }
        }
    }
    
    func select(_ section: Sections, when isVisible: Bool) {
        if allSections.first == section && isVisible == false {
            allSections.removeFirst()
        } else {
            guard let index = Sections.allCases.firstIndex(where: { $0 == allSections.first }),
                  index > 0 && index < Sections.allCases.count
            else { return }
            
            let previousSection = Sections.allCases[index - 1]
            guard previousSection == section && isVisible else { return }
            allSections.insert(section, at: 0)
        }
        
        guard let currentSection = allSections.first, currentSection != selectedSection else { return }
        withAnimation { selectedSection = currentSection }
    }
}

// just UI

extension ContentView {
    var generalSection: some View {
        VStack(alignment:.leading, spacing: 12) {
            Text("Super Room")
                .font(.title)
                .fontWeight(.medium)
                .padding(.top, 40)
                .id(Sections.general)
            
            Text("5,0 ★★★★★ \(Text("(2 356)").foregroundStyle(.tint))")
                .font(.headline)
                .fontWeight(.medium)
 
            Text("Holiday Outt, London")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .redacted(reason: .placeholder)
            Text("Available")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                 .redacted(reason: .placeholder)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var servicesSection: some View {
        VStack(spacing: 16) {
            Text("Services")
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .id(Sections.services)
            
            servicesSectionItem()
            servicesSectionItem()
            servicesSectionItem()
            servicesSectionItem()
        }
    }
    
    var facilitiesSection: some View {
        VStack(spacing: 24) {
            Text("Facilities: ")
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .id(Sections.facilities)
            
            Text("\(Image(systemName: "wifi")) \(Image(systemName: "tv")) \(Image(systemName: "snowflake")) \(Image(systemName: "cup.and.saucer.fill")) \(Image(systemName: "bed.double.fill")) \(Image(systemName: "shower")) \(Image(systemName: "lock.shield.fill")) \(Image(systemName: "car.fill"))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .redacted(reason: .placeholder)
        }
    }
    
    var reviewsSection: some View {
        VStack {
            Text("Reviews")
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 12)
                .id(Sections.reviews)
            Group{
                Text("★★★★★")
                    .font(.title)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("5,0 \(Text("(2 356)").foregroundStyle(.tint))")
                    .font(.headline)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                reviewsSectionItem()
                reviewsSectionItem()
                reviewsSectionItem()
                reviewsSectionItem()
            }
            .redacted(reason: .placeholder)
       
        }
    }
    
    var buySection: some View {
        VStack(spacing: 16) {
            Text("Buy")
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .id(Sections.buy)
            
            servicesSectionItem()
            servicesSectionItem()
            servicesSectionItem()
            servicesSectionItem()
        }
    }
    
    var aboutSection: some View {
        VStack(alignment:.leading,spacing: 12) {
            Text("About")
                .font(.title)
                .fontWeight(.medium)
                .padding(.top, 40)
                .id(Sections.about)
            Group{
                Text("5,0 ★★★★★ \(Text("(2 356)").foregroundStyle(.tint))")
                    .font(.headline)
                    .fontWeight(.medium)
 
                Text("Holiday Outt, London")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
 
                Text("Available")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
             }
            .redacted(reason: .placeholder)
          
        }
        
    }
}

extension ContentView {
    func servicesSectionItem() -> some View {
        VStack (alignment:.leading){
            HStack {
                VStack (alignment:.leading){
                    Text("Superior Room Standard")
                        .font(.body)
                        .fontWeight(.medium)
 
                    Text("3-5 days")
                        .font(.callout)
                        .foregroundStyle(.secondary)
 
                    Text("from 189 EUR")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                      
                }
                
                Spacer()
                
                Text("Book")
                    .padding(.all, 8)
                    .font(.callout)
                    .background(Capsule().stroke())
            }
            Divider()
        }
        .redacted(reason: .placeholder)
    }
    
    func reviewsSectionItem() -> some View {
        VStack(alignment:.leading,spacing: 12) {
            HStack {
                Text("JA")
                    .foregroundStyle(.purple)
                    .padding()
                    .background(
                        Circle()
                            .fill(Color.purple.opacity(0.4))
                    )
                
                VStack {
                    Text("John Appleased")
                        .font(.callout)
                    Text("Today at 10:42 AM")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                 }
            }
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum.")
                .font(.callout)
            Divider()
        }
         .redacted(reason: .placeholder)
    }
}
