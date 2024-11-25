//
//  StockCellView.swift
//  Stocks
//
//  Created by Rehan Khan on 1/23/22.
//

import SwiftUI

struct StockCellView: View {
    
    let stock: StockViewModel
    let onSelected: (StockViewModel) -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(stock.symbol)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(stock.name)
                    .opacity(0.4)
            }
            
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text("\(stock.price, specifier: "%.2f")")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                
                Button {
                    // action
                } label: {
                    Text(stock.change)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }.frame(maxWidth: 60)
                     .background(changeColor(stock.change))
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onSelected(stock)
        }
    }
}

struct StockCellView_Previews: PreviewProvider {
    static var previews: some View {
        StockCellView(stock: StockViewModel(stock: Stock(symbol: "APLE", description: "Apple", price: 162, change: "+2.42", historicalPrices: [])), onSelected: { _ in })
    }
}
