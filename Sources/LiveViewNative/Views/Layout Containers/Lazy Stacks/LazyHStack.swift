//
//  LazyVStack.swift
//
//
//  Created by Carson Katri on 2/9/23.
//

import SwiftUI

/// Horizontal stack that creates Views lazily.
///
/// Lazy stacks behave similar to their non-lazy counterparts.
///
/// Use the ``pinnedViews`` attribute to pin section headers/footers when contained in a `ScrollView`.
///
/// ```html
/// <ScrollView axes="horizontal">
///     <LazyHStack>
///         <%= for i <- 1..50 do %>
///             <Text id={i |> Integer.to_string} font="largeTitle"><%= i %></Text>
///         <% end %>
///     </LazyHStack>
/// </ScrollView>
/// ```
///
/// ## Attributes
/// * ``alignment``
/// * ``spacing``
/// * ``pinnedViews``
///
/// ## See Also
/// ### Stacks
/// * ``HStack``
#if swift(>=5.8)
@_documentation(visibility: public)
#endif
struct LazyHStack<R: RootRegistry>: View {
    @ObservedElement private var element: ElementNode
    @LiveContext<R> private var context
    
    /// The vertical alignment of views within the stack. Defaults to center-aligned.
    ///
    /// See ``LiveViewNative/SwiftUI/VerticalAlignment``.
    #if swift(>=5.8)
    @_documentation(visibility: public)
    #endif
    @Attribute("alignment") private var alignment: VerticalAlignment = .center
    /// The spacing between views in the stack. If not provided, the stack uses the system spacing.
    #if swift(>=5.8)
    @_documentation(visibility: public)
    #endif
    @Attribute("spacing") private var spacing: Double?
    /// Pins section headers/footers.
    ///
    /// See ``LiveViewNative/SwiftUI/PinnedScrollableViews``.
    #if swift(>=5.8)
    @_documentation(visibility: public)
    #endif
    @Attribute("pinned-views") private var pinnedViews: PinnedScrollableViews = []
    
    public var body: some View {
        SwiftUI.LazyHStack(
            alignment: alignment,
            spacing: spacing.flatMap(CGFloat.init),
            pinnedViews: pinnedViews
        ) {
            context.buildChildren(of: element)
        }
    }
}
