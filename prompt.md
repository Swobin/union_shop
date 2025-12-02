# LLM Prompts for Implementing Product Detail Page in Union Shop Flutter App

## Overview
I am building a Flutter e-commerce app for the University of Portsmouth Students' Union shop. The app needs a detailed product view page where users can see product information, select variants (size, color), adjust quantity, and add items to their cart (UI only, no backend).

---

## Prompt 1: Product Data Model

### Context
I need a data model to represent products in my Union Shop app. Products have multiple properties including pricing, variants, images, and specifications.

### Current Structure
- App uses hardcoded data throughout
- No backend/API integration
- Images are stored in `assets/images/`
- Navigation routes defined in `lib/main.dart`

### Requirements

**Create `lib/models/product.dart`:**

#### 1. Product Class Properties

The Product class should be a comprehensive representation of a physical product in the shop. Think of it as a digital catalog entry that contains everything a customer needs to know before purchasing.

**Basic Information:**
Start with foundational properties that identify the product. Each product needs a unique ID (like "ESSZIP001") for tracking purposes, even though we're not using a database. The name should be customer-facing and descriptive. The description is crucial - write 2-3 paragraphs that explain what makes the product special, its uses, and why students would want it. Include the category to group similar items together (like "Essential Range" or "Portsmouth City Collection").

**Pricing Structure:**
Handle pricing with flexibility. The regular price is always present as a double representing pounds sterling. The sale price is optional (nullable) - when it exists, the product is on sale. A SKU (Stock Keeping Unit) helps identify specific variants, though for our simple app it's mainly for display purposes.

**Product Variants:**
Real products come in different configurations. Store multiple image paths in a list - you'll need at least 4-5 images showing different angles (front, back, detail shots, lifestyle images). Sizes should be a list of strings like ['XS', 'S', 'M', 'L', 'XL', 'XXL'], though some products might have fewer options. Colors work the same way - a list of available color names like ['Navy', 'White', 'Grey'].

**Specifications:**
Material composition is important for clothing (e.g., "80% Cotton, 20% Polyester"). Care instructions tell customers how to maintain the product. The inStock boolean indicates availability - this drives whether the Add to Cart button works.

**Customer Feedback (Static):**
Include rating as a double from 0.0 to 5.0 (like 4.5) and reviewCount as an integer. These are purely for display since we don't have a real review system.

#### 2. Helper Methods

Create getter methods to simplify common operations:

**hasDiscount:** This boolean getter checks if salePrice is not null. It's cleaner to write `if (product.hasDiscount)` than `if (product.salePrice != null)` throughout your code.

**discountPercentage:** Calculate what percentage off the sale price represents. If regular price is £20 and sale price is £15, this returns 25 (representing 25% off). The math is: ((price - salePrice) / price) × 100, rounded to the nearest integer.

**displayPrice:** Returns whichever price should be shown prominently - the sale price if it exists, otherwise the regular price. This simplifies UI code since you can always call `displayPrice` without checking for sales.

**formattedPrice and formattedDisplayPrice:** Convert numbers to currency strings. Use `toStringAsFixed(2)` to ensure two decimal places, and prepend the pound symbol. For example, 14.99 becomes "£14.99".

#### 3. Sample Products

Create a static list called `sampleProducts` containing realistic product data. You need at least three products:

**Essential Zip Hoodie (On Sale):**
This is your flagship sale item. Set the ID to something like "ESSZIP001". Regular price is £20.00, currently on sale for £14.99. Offer it in Navy, White, and Grey colors, with sizes from XS to XXL. Write a compelling description about how it's part of the Essential Range promotion (over 20% off), emphasizing the comfort of the cotton-polyester blend and the university branding. Include care instructions like "Machine wash cold, tumble dry low, do not bleach." List 4-5 image paths (they don't need to exist yet - use placeholders like 'assets/images/essential_hoodie_front.png'). Give it a high rating like 4.5 stars with 127 reviews. Mark it as in stock.

**Signature T-Shirt:**
Price this at £14.99 with no sale. Offer Navy, White, and Purple options (purple being the university brand color). Include all standard sizes. Describe it as a premium cotton tee from the Signature collection, explaining how it's perfect for everyday campus wear and represents university pride. Mention it's 100% cotton for maximum comfort. Rate it at 4.7 stars with 89 reviews.

**Portsmouth City Hoodie:**
A premium item at £29.99 (no sale). Only available in Navy and Grey, and sizes start at S (no XS available). This one celebrates Portsmouth city pride with local landmarks or themes on the design. Explain it's 85% Cotton, 15% Polyester for extra warmth. It should have care instructions allowing slightly warmer washing. Rate it 4.6 stars with 56 reviews.

**Optional Additional Products:**
Consider adding an out-of-stock item to test that UI state. Maybe add a merchandise item like a mug or water bottle with different properties (no sizes, single color). This variety helps test edge cases.

#### 4. Code Structure

The constructor should require all non-nullable fields and allow optional fields. Use `const` constructor if possible for better performance. Add a `toString()` method for debugging - it should print the product name and ID at minimum.

Store the sample products in a static list so you can access them anywhere as `Product.sampleProducts`. This simulates a database without actually implementing one.

### Deliverable

A complete `product.dart` file that includes:
- A Product class with all 14 properties clearly defined
- Five helper getter methods that simplify price and discount operations
- At least 3 fully-detailed sample products with realistic descriptions, pricing, and specifications
- A static `sampleProducts` list containing all sample data
- Proper constructor with required and optional parameters
- Documentation comments explaining what each property represents

The sample products should read like real catalog entries - professional descriptions, realistic pricing, multiple color options, and complete specifications. Image paths can be placeholders for now.

---

## Prompt 2: Product Detail Page Structure

### Context
I need to create the main product detail page that will display individual products. This page should use my existing header and footer widgets and be fully responsive.

### Current App Structure
- **Header Widget**: Available at `lib/widgets/header.dart` as `AppHeader(activePage: 'shop')`
- **Footer Widget**: Available at `lib/widgets/footer.dart` as `AppFooter()`
- **Brand Color**: Purple `#4d2963` - use this for all interactive elements
- **Existing Routes**: The `/product-detail` route should already be defined in `main.dart`

### Requirements

**Create `lib/views/product_detail_page.dart`:**

#### 1. StatefulWidget Foundation

This page needs to be a StatefulWidget because it manages several pieces of interactive data that change based on user input.

**Why StatefulWidget?**
Unlike the static homepage or about page, this page has dynamic elements. When a user taps a size button, we need to remember their choice and update the UI to show which size is selected. Same for color selection, quantity adjustments, and which product image is currently displayed.

**The Product Parameter:**
The page should accept a Product object through its constructor. This allows the same page template to display different products based on which product card the user clicked. Make this a required parameter since the page is meaningless without product data.

**State Variables:**
Maintain four pieces of state in your `_ProductDetailPageState` class:

- `selectedSize`: A nullable String that starts as null (no size selected yet) and gets updated when the user taps a size button
- `selectedColor`: Also nullable String, starts null, stores the user's color choice
- `quantity`: An integer starting at 1, representing how many items to add to cart
- `currentImageIndex`: An integer starting at 0, tracking which image from the product's image list should be displayed in the main gallery view

These state variables power the entire interactive experience. When any of them change via `setState()`, the UI re-renders to reflect the new state.

#### 2. Basic Layout Structure

Build the page using a Scaffold with white background. Don't include an AppBar since you're using the custom AppHeader widget.

**The ScrollView:**
Wrap your entire body in a SingleChildScrollView. Product detail pages are typically long - they have large images, descriptions, specifications, reviews, and related products. Users need to scroll to see everything, and SingleChildScrollView handles this smoothly. It also prevents layout overflow errors when content exceeds screen height.

**Main Column Structure:**
Inside the scroll view, create a Column that stacks everything vertically:
- Start with the AppHeader widget at the top
- Optionally add breadcrumb navigation (like "Home > Shop > Essential Range > Essential Zip Hoodie") to help users understand where they are in the site hierarchy
- The main product content area comes next (this is where gallery and info panel go)
- Below that, add expandable sections for product details, shipping info, and reviews
- Then a "You May Also Like" related products section
- Finally, close with the AppFooter

**Why this order?**
Users expect to see the product immediately, then scroll for additional details, then see suggestions for more products, then footer information. This matches standard e-commerce patterns.

#### 3. Responsive Layout System

The product content area (gallery + info panel) needs dramatically different layouts for different screen sizes.

**Desktop Layout (screen width > 900px):**
Use a Row to create two columns. Give more space to the image gallery (60% width) and less to the info panel (40% width). This lets desktop users see large, detailed images while still having product information visible without scrolling.

Use an `Expanded` widget with `flex: 3` for the gallery and `flex: 2` for the info panel to achieve this 60/40 split. Add some horizontal spacing between them (maybe 32 or 48 pixels).

**Mobile Layout (screen width ≤ 900px):**
Switch to a Column instead of a Row. Stack the image gallery at the top taking full width, then the product information below it also full width. This ensures mobile users get large, easily viewable images and can easily tap the size/color selectors below.

**Implementation Pattern:**
Check the screen width using `MediaQuery.of(context).size.width`. Store this in a boolean variable like `isDesktop`. Then use a conditional expression to return either the Row (desktop) or Column (mobile) layout.

Add appropriate padding around the content area - maybe 40 pixels on desktop, 16 pixels on mobile. This prevents content from touching screen edges.

#### 4. Navigation and Error Handling

**Receiving the Product:**
In your build method, retrieve the Product object from the navigation route arguments. The pattern is:
```dart
final product = ModalRoute.of(context)!.settings.arguments as Product?;
```

The question mark makes it nullable because navigation might fail or be called incorrectly.

**Handling Missing Products:**
If product is null, don't try to display product information - you'll get errors. Instead, return a completely different Scaffold showing an error state. Display a large error icon, a message like "Product not found", and a button that calls `Navigator.pop(context)` to return to the previous page.

**Back Navigation:**
Consider adding a back button or clickable breadcrumb at the top. When tapped, it should call `Navigator.pop(context)` to return users to wherever they came from (product listing page, homepage, etc.).

### Deliverable

A basic page structure file that:
- Extends StatefulWidget and defines all four state variables
- Creates a Scaffold with AppHeader and AppFooter
- Uses SingleChildScrollView for the scrollable content
- Implements responsive layout logic (Row for desktop, Column for mobile)
- Handles the Product parameter from navigation routes
- Shows an error screen when product data is missing
- Contains clearly marked placeholder comments for each major section (image gallery, info panel, detail sections, related products)

The page should compile and run without errors, showing the header and footer with empty space in between where content will go. Test it by navigating to it from another page and passing a Product object.

---

## Prompt 3: Product Image Gallery Widget

### Context
I need an interactive image gallery for the product detail page. Users should see a large main image with thumbnail navigation, with different layouts for mobile and desktop.

### Requirements

**Create the gallery widget in `product_detail_page.dart`:**

#### 1. Main Image Display

**Purpose and Importance:**
The main image is the most important visual element on the product page. Customers make purchase decisions largely based on product images, so this needs to be large, clear, and high-quality. Think of it like the hero image in a magazine advertisement.

**Size and Proportions:**
On desktop, aim for a minimum height of 500 pixels - large enough to see fabric texture, logo details, and product features. On mobile, it can take the full width of the screen. Use an AspectRatio widget to maintain consistent proportions (1:1 for a square, or 4:3 for a slight rectangle). This prevents images from appearing stretched or squished.

**Displaying the Current Image:**
The gallery shows `product.images[currentImageIndex]`. This array index approach means the first image (index 0) displays by default, and clicking thumbnails updates the index to show different images. Use an Image.asset widget since your images are stored in the assets folder.

**Smooth Transitions:**
When users click thumbnails, don't just swap images instantly - that feels jarring. Wrap your Image widget in an AnimatedSwitcher. Set its duration to about 300 milliseconds and provide a fade transition. Now when the image changes, the old one fades out while the new one fades in, creating a smooth, professional effect.

**Error Handling:**
Sometimes images fail to load (wrong path, missing file, etc.). Use the errorBuilder parameter to catch these failures. Show a grey Container with a centered Icons.image_not_supported icon so users know something's wrong rather than seeing a blank space or error message.

#### 2. Thumbnail Gallery

**Purpose:**
Thumbnails serve two functions: they preview all available images and act as navigation buttons to change the main image.

**Desktop Layout:**
Below the main image, create a Wrap or GridView containing all thumbnails. Make each one about 100x100 pixels - large enough to see clearly but small enough to fit 4-6 thumbnails in a row. Add spacing (maybe 8-12 pixels) between thumbnails so they don't touch. The Wrap widget automatically handles rows, wrapping to a new line when needed.

**Mobile Layout:**
On mobile, vertical space is precious. Instead of wrapping thumbnails into rows, create a horizontal scrollable ListView. Set the scroll direction to horizontal. Make thumbnails slightly smaller (80x80 pixels) and add spacing between them. Users can swipe left/right through all available images.

**Active Thumbnail Highlighting:**
The thumbnail matching the currently displayed image needs visual indication. Compare each thumbnail's index to `currentImageIndex`. When they match, add a thick border (3 pixels) in the brand purple color (#4d2963). Unselected thumbnails should have a thin grey border (1 pixel). This makes it obvious which image is currently being viewed.

**Why Active Highlighting Matters:**
Without it, users get confused about which view they're currently seeing, especially when all thumbnails look similar (like front/back views of the same product).

#### 3. Interaction Behavior

**Thumbnail Tapping:**
Wrap each thumbnail in a GestureDetector widget. When tapped (onTap callback), call `setState()` to update `currentImageIndex` to that thumbnail's index. This triggers a re-render, updating the main image to the AnimatedSwitcher widget, which smoothly transitions to the new image.

**Why setState is Essential:**
Without it, changing the variable wouldn't update the UI. setState tells Flutter "this state changed, please rebuild the widget tree."

**Responsive Switching:**
Use MediaQuery to check screen width. If width > 900px, show the Wrap grid layout. Otherwise, show the horizontal ListView. Store the boolean result (`final isDesktop = MediaQuery.of(context).size.width > 900;`) and use it in a conditional to return the appropriate widget.

#### 4. Widget Organization

**Creating Helper Methods:**
Instead of putting all this code directly in your build method, organize it into private helper methods:

- `_buildMainImage()`: Returns the main image display with AnimatedSwitcher
- `_buildThumbnails()`: Returns either the Wrap grid or horizontal ListView based on screen size
- `_buildImageGallery()`: Combines both into a Column and returns the complete gallery

**Benefits:**
This keeps your build method clean and readable. Each method has a single responsibility. It's easier to modify or debug specific parts later.

**Callback Pattern:**
The thumbnail builder needs a way to update the parent widget's state. Pass a callback function like `Function(int) onImageTapped` that gets called with the new index. The parent widget handles the actual setState call.

#### 5. Edge Cases

**Single Image:**
If a product only has one image, you could hide the thumbnail row entirely. Check `if (product.images.length > 1)` before rendering thumbnails.

**Missing Images:**
Use the errorBuilder on every Image.asset to gracefully handle missing files. Never let an image error crash the page or show an ugly red error screen.

### Deliverable

An image gallery component that:
- Displays one large main image prominently (minimum 500px on desktop)
- Shows all product images as smaller clickable thumbnails
- Highlights the active thumbnail with a purple border
- Uses different layouts for desktop (wrapped grid) and mobile (horizontal scroll)
- Transitions smoothly between images using AnimatedSwitcher
- Handles missing images with placeholder containers
- Is organized into helper methods for maintainability
- Updates state correctly when thumbnails are clicked

Test by creating a product with 5-6 images and verifying all thumbnails appear, clicking each one changes the main image, the active border moves correctly, and the layout adjusts when you resize the browser window.

---

## Prompt 4: Product Information Panel Widget

### Context
I need a widget to display all product information including title, price, rating, description, SKU, and availability status.

### Requirements

**Create the info panel widget in `product_detail_page.dart`:**

#### 1. Product Header Section

**The Product Name:**
This should be the first and most prominent text element in the panel. Use a large font size (28 points) with bold weight. The product name is what users are buying, so it needs to stand out. Don't truncate it - if the name is long, let it wrap to a second line.

**SKU Display:**
Below the name, show the SKU in much smaller text (14 points) using a grey color. This is reference information that's useful but not primary. Format it like "SKU: ESSZIP-NAV-L" so it's clear what the code represents.

**Availability Badge:**
Create a small colored badge indicating stock status. For in-stock items, use a green background (#4CAF50) with white text saying "In Stock". For out-of-stock items, use red background (#F44336) with white text saying "Out of Stock". Add padding (8 pixels horizontal, 4 pixels vertical) and slight border radius (4 pixels) so it looks like a badge rather than just colored text. This gives users immediate visual feedback about whether they can buy the product.

#### 2. Price Display Strategy

**Regular Pricing (No Sale):**
When the product isn't on sale, display the price large and bold (32 point font) in the brand purple color (#4d2963). This draws the eye and makes the cost immediately clear. Format it properly as "£14.99" - always show two decimal places even if it's a round number like £20.00.

**Sale Pricing (Multiple Elements):**
When there's a sale, you need to show three pieces of information simultaneously:

First, display the sale price most prominently - same large size and purple color as regular pricing. This is what they'll actually pay.

Second, show the original price next to it but make it smaller (24 point font), grey colored, and with strikethrough decoration. This shows the value they're getting.

Third, calculate and display the discount percentage in a small colored badge (red background works well). Format it like "-25%" so it's immediately clear this is money saved.

Arrange these horizontally in a Row, with small spacing between each element. The visual hierarchy should make the sale price most prominent, with the other two providing supporting context.

**Why This Matters:**
Research shows that displaying original prices alongside sale prices increases conversion rates. Customers feel they're getting a better deal when they see both numbers.

#### 3. Star Rating System (Static Display)

**Visual Rating:**
Instead of just showing "4.5/5", create a visual star display. This is more engaging and easier to scan quickly.

Build a row of 5 star icons. For a 4.5 rating, show 4 filled stars (Icons.star), 1 half-filled star (Icons.star_half), and 0 empty stars (Icons.star_border). Color the filled and half stars with an amber/gold color (#FFC107) to make them stand out. Grey empty stars indicate rating potential.

**Implementation Logic:**
Loop from 1 to 5. For each position, check if the rating is greater than or equal to that number (filled star), between that number minus 1 and the number (half star), or less (empty star). This automatically handles fractional ratings.

**Review Count:**
Next to the stars, add grey text showing the numeric rating and review count: "(4.5/5 · 127 reviews)". The bullet point separator (·) keeps it compact. This provides credibility - 127 reviews is more trustworthy than 3 reviews.

#### 4. Product Description Formatting

**Content:**
Display the full product description from your Product model. This should be 2-3 paragraphs explaining what makes the product special, its features, and why students would want it.

**Typography:**
Use a comfortable reading size (16 points) with increased line height (1.6). This extra vertical space between lines makes longer text much easier to read. Don't make users strain to read a wall of text.

**Width Constraint:**
On desktop, constrain the maximum width to about 600 pixels. Text lines that are too wide become hard to read - your eyes lose their place when jumping to the next line. Wrap the description in a ConstrainedBox widget to enforce this limit. On mobile, let it fill the width naturally since screens are narrower anyway.

**Content Strategy:**
Write descriptions that sell the product. Explain the material benefits ("soft cotton blend for all-day comfort"), the practical uses ("perfect for lectures or campus events"), and the emotional appeal ("show your university pride").

#### 5. Product Specifications Table

**Information to Display:**
Create labeled rows for key specifications:
- Material composition (from product.material)
- Care instructions (from product.care)
- Country of origin (can hardcode to "United Kingdom")
- Any other relevant specs

**Layout Pattern:**
Use a two-column approach. The left column shows labels in bold (like "Material:") with consistent width (maybe 120 pixels). The right column shows the values in regular weight. Align everything to the start (left) for readability.

Add vertical spacing (8 pixels) between each specification row so they don't run together visually.

**Why Specifications Matter:**
Different customers care about different details. Some need to know the material for allergy reasons, others want specific care instructions. Providing this upfront reduces customer service questions and returns.

#### 6. Overall Panel Layout

**Spacing Strategy:**
Use consistent spacing throughout the panel to create visual rhythm. Good spacing typically means:
- 8 pixels between small elements (like label and value)
- 16 pixels between related sections (like stars and description)
- 24 pixels between major sections (like pricing area and description area)

**Padding:**
Add padding around the entire panel - 24 pixels on desktop, maybe 16 pixels on mobile. This prevents content from touching the edges and gives it room to breathe.

**Visual Hierarchy:**
By using different font sizes, weights, and colors, you create a visual hierarchy:
1. Product name (largest, bold)
2. Price (very large, colored)
3. Description (medium, generous line height)
4. Specifications (smaller, structured)
5. SKU (smallest, grey)

This hierarchy guides the user's eye through the information in order of importance.

### Deliverable

A product information panel that:
- Shows the product name prominently at the very top
- Displays SKU and availability badge clearly but with less emphasis
- Handles pricing correctly for both regular and sale scenarios
- Includes a visual 5-star rating with review count
- Shows the full product description with comfortable reading formatting
- Lists material, care, and origin specifications in an organized format
- Uses consistent spacing throughout (8/16/24px pattern)
- Maintains good visual hierarchy through size and color
- Constrains text width on desktop for readability
- Works responsively on mobile and desktop

Test with products that have different attributes - one on sale, one regular priced, different ratings, varying description lengths - to ensure the layout handles all cases gracefully.

---

## Prompt 5: Variant Selectors (Size, Color, Quantity)

### Context
I need interactive selectors for size, color, and quantity. These should validate user selections and update the UI immediately.

### Requirements

**Create variant selector widgets in `product_detail_page.dart`:**

#### 1. Size Selector Design

**Why Buttons Over Dropdowns:**
For clothing sizes, buttons are superior to dropdowns. Users can see all options simultaneously without opening a menu. It requires fewer taps and provides better visual feedback. Dropdowns hide choices and require two interactions (open, then select).

**Button Group Implementation:**
Create a section starting with a label "Select Size:" in bold 16-point text. Below that, display all sizes from `product.sizes` as individual OutlinedButton widgets arranged in a Wrap. The Wrap automatically handles wrapping to new lines if needed, though most size ranges fit on one line.

**Visual States:**
Each size button needs two distinct appearances:
- **Selected**: Purple background (#4d2963) with white text, creating strong contrast
- **Unselected**: White background with black text and a grey border

**Interaction:**
When any size button is tapped, call `setState(() => selectedSize = size)`. This updates the state variable and re-renders the UI, changing that button to the selected appearance.

**Why This Matters:**
The selected state provides immediate visual confirmation. Users know exactly what they've chosen without having to check anywhere else.

#### 2. Color Selector with Swatches

**Visual Color Representation:**
Instead of just showing color names, display actual color swatches. This is more intuitive - users see the actual navy blue or purple, not just the word. Create circular containers filled with the actual color values.

**Color Mapping:**
Define a map converting color names to Flutter Color objects:
- 'Navy' → Dark navy blue (Color(0xFF001F3F))
- 'White' → Pure white (Colors.white)
- 'Grey' → Medium grey (Colors.grey[600])
- 'Purple' → Brand purple (Color(0xFF4d2963))
- etc.

**Swatch Design:**
Each color option shows as:
- A 50x50 pixel circle filled with the color
- A border that changes based on selection (1px grey when unselected, 3px purple when selected)
- A checkmark icon inside if selected
- The color name displayed below in small text

**Special Handling for White:**
White swatches are invisible against white backgrounds. Always give white swatches a light grey border so they're visible. When selected, replace this with the purple border.

**Checkmark Color Logic:**
For dark colors (navy, purple), use a white checkmark. For light colors (white), use a black checkmark so it's visible.

**Layout:**
Arrange color swatches horizontally in a Wrap with 12-pixel spacing. The Wrap handles wrapping if there are many colors or on narrow screens.

#### 3. Quantity Selector Controls

**Purpose:**
Allow users to specify how many units they want. While many purchases are single items, some customers buy multiple (gifts, society orders, etc.).

**Three-Part Layout:**
Create a horizontal Row containing:
1. Minus button (IconButton with Icons.remove)
2. Quantity display (Text showing current number)
3. Plus button (IconButton with Icons.add)

**Quantity Display:**
Show the current quantity in a bordered container (1px grey border, slight border radius). Make the number bold and 18-point size. Center it in a 50-pixel wide space so it doesn't jump around when changing from single to double digits.

**Button Constraints:**
Implement minimum and maximum limits:
- **Minimum**: 1 (can't order zero items)
- **Maximum**: 99 (reasonable UI limit)

**Button States:**
Disable buttons when limits are reached:
- When quantity is 1, disable the minus button (set onPressed to null, grey color)
- When quantity is 99, disable the plus button
- Enabled buttons are black, disabled buttons are grey

**Interaction:**
Plus button calls `setState(() => quantity++)` to increment. Minus button calls `setState(() => quantity--)` to decrement. The setState rebuilds the UI, updating the displayed number and potentially disabling buttons.

**Why Limits Matter:**
The minimum prevents user errors (ordering zero items makes no sense). The maximum keeps quantities reasonable and prevents display issues (a quantity of 9999 would look weird in the UI).

#### 4. Overall Selector Layout

**Vertical Stacking:**
Arrange all three selectors vertically in a Column. This reads naturally top-to-bottom: choose size, then color, then quantity.

**Spacing:**
Add 24 pixels between each selector section. This creates clear visual separation so users don't confuse where one selector ends and another begins.

**Labels:**
Each selector needs a clear label above it:
- "Select Size:" (bold, 16pt)
- "Select Color:" (bold, 16pt)
- "Quantity:" (bold, 16pt)

Add 8 pixels between label and selector for a bit of breathing room.

**Responsive Considerations:**
On mobile, make sure size buttons and color swatches are large enough to tap accurately. The minimum touch target size should be 48x48 pixels according to Material Design guidelines. Your buttons are close to this already, but add enough padding to reach it.

On desktop, elements can be slightly smaller since users have a precise mouse cursor, but don't go below 40x40 pixels.

#### 5. State Management Integration

**How It All Works Together:**
Each selector modifies one state variable:
- Size buttons → `selectedSize` 
- Color swatches → `selectedColor`
- Quantity controls → `quantity`

These state variables serve multiple purposes:
1. Determine visual appearance (which button/swatch is highlighted)
2. Enable/disable the Add to Cart button (need size AND color selected)
3. Populate the cart confirmation message
4. Calculate total price (price × quantity)

**Validation:**
The Add to Cart button checks if both `selectedSize` and `selectedColor` are not null. If either is null, the button remains disabled. This prevents users from adding incomplete product configurations.

### Deliverable

Three interactive selector components that:
- **Size selector**: Displays all sizes as buttons, shows selected size with purple background, updates state on click
- **Color selector**: Shows actual color swatches with names, highlights selection with purple border and checkmark, handles white color visibility
- **Quantity selector**: Has +/- buttons, displays current number, enforces 1-99 range, disables buttons at limits
- All selectors have clear labels and consistent spacing (24px between sections)
- Touch targets meet minimum size requirements (48x48px on mobile)
- Visual feedback is immediate (no delay between click and state update)
- Disabled states are clearly indicated (grey color, no interaction)

Test by verifying:
- Clicking sizes updates the visual state correctly
- Only one size can be selected at a time
- Color swatches highlight properly and show checkmarks
- Quantity buttons work and respect limits
- Resizing the window shows proper responsive behavior
- All elements are easily tappable on mobile devices

---

## Prompt 6: Add to Cart Button with Validation

### Context
I need an "Add to Cart" button that validates user selections, provides feedback, and shows success messages. This is UI only - no actual cart functionality.

### Requirements

**Create the Add to Cart button in `product_detail_page.dart`:**

#### 1. Button Visual Design

**Primary Call-to-Action:**
This button is the most important element on the page - it's the conversion point. Make it impossible to miss with bold styling.

**Styling Specifications:**
Use the brand purple (#4d2963) as the background color to match the site's design language. Make the text white and bold ("ADD TO CART") with extra letter spacing (1.2) for emphasis. The height should be 56 pixels - large enough to be easy to tap on mobile devices without being comically oversized.

**Width Behavior:**
On mobile, make the button full-width (minus page padding) so it's easy to hit. On desktop, constrain it to a maximum of 300 pixels and consider positioning it prominently in the info panel.

**Border and Shadow:**
Use sharp corners (border radius 0) to match the overall site aesthetic. Add a subtle elevation (2 points) to give it depth and make it appear clickable.

#### 2. Validation Logic

**What Makes a Valid Selection:**
The button should only work when ALL of these conditions are true:
1. User has selected a size (`selectedSize != null`)
2. User has selected a color (`selectedColor != null`)
3. Quantity is at least 1 (should always be true given your quantity controls)
4. Product is in stock (`product.inStock == true`)

**Creating a Validation Getter:**
Instead of checking these conditions repeatedly, create a getter that returns true only when all conditions are met. This keeps your code DRY (Don't Repeat Yourself) and makes the logic clear in one place.

**Disabled State Visual:**
When validation fails, change the button's appearance dramatically:
- Background becomes medium grey (Colors.grey[400])
- Opacity reduces to 0.6 for a "ghosted" appearance
- The onPressed handler is set to null, preventing any interaction
- No shadow/elevation (flat appearance)

**Why Disabled State Matters:**
It provides immediate visual feedback that something's missing. Users understand they need to complete selections before proceeding.

#### 3. Success Feedback (Valid Selection)

**SnackBar Message:**
When the button is clicked and all validations pass, show a success SnackBar at the bottom of the screen. This provides confirmation without being intrusive (unlike a dialog that blocks the screen).

**Message Content:**
Include all the details of what was added:
"Added to cart: Essential Zip Hoodie (Medium, Navy) x2"

This specificity confirms exactly what the user added, reducing any uncertainty.

**Visual Design:**
Use a green background (#4CAF50 or similar) to indicate success. Include a checkmark icon (Icons.check_circle) before the text. Make the text white for good contrast. Set duration to 3 seconds - long enough to read but not so long it's annoying.

**Optional Action Button:**
Add a "VIEW CART" action to the SnackBar. Though it won't navigate anywhere (no cart page implemented), it shows best practice UI patterns. The action text should be white to stand out against the green background.

**Optional Button State Animation:**
For extra polish, temporarily change the button text to "ADDED!" with a checkmark icon for 1 second after clicking. Use `Future.delayed` to revert it back. This provides immediate inline feedback before the SnackBar even appears.

#### 4. Error Feedback (Invalid Selection)

**Determining the Error:**
When the button is clicked but validation fails, figure out which specific requirement isn't met. Check in priority order:
1. Is product out of stock? → "This product is currently out of stock"
2. Is size missing? → "Please select a size"
3. Is color missing? → "Please select a color"
4. Otherwise → "Please complete your selections"

**Why Specific Messages:**
Generic "Invalid selection" messages frustrate users. Specific guidance ("Please select a size") immediately tells them what to fix.

**Error SnackBar Design:**
Use a red background (#F44336 or similar) to indicate an error state. Include an error icon (Icons.error_outline) before the text. Keep it brief - just the error message. Set duration to 2 seconds since error messages are typically shorter than success messages.

**When to Show Errors:**
Only show error feedback if the user actually clicks the button. Don't show errors before they've tried to submit - that's premature and annoying.

#### 5. Mobile UX Enhancement (Optional)

**Sticky Bottom Button:**
On mobile devices with long product pages, users have to scroll back up to find the Add to Cart button. Consider making it "sticky" to the bottom of the viewport.

**Implementation:**
Use the Scaffold's bottomNavigationBar property. Place the button in a Container with white background, padding, and a subtle top shadow. This keeps the button always visible and accessible while scrolling.

**Content Padding:**
When using sticky bottom button, add bottom padding to your scroll view content (80 pixels or so) to prevent content from being hidden behind the sticky button.

**Trade-offs:**
Sticky buttons improve conversion but take up screen space. On very small phones, they might feel intrusive. Test with your target audience.

#### 6. Accessibility Considerations

**Semantic Labels:**
Add a semantic label to the button describing its action: "Add ${product.name} to shopping cart". Screen readers announce this to visually impaired users.

**Disabled State Announcement:**
When the button is disabled, screen readers should announce why. Consider adding a Tooltip explaining what's needed ("Select size and color to continue").

**Touch Target Size:**
The 56-pixel height ensures the button meets minimum touch target requirements (48x48 pixels) even on small screens.

### Deliverable

An Add to Cart button that:
- Has prominent purple background and white text when enabled
- Shows grey, semi-transparent appearance when disabled
- Only enables when size, color, and stock status are all valid
- Shows green success SnackBar with specific details when clicked (if valid)
- Shows red error SnackBar with guidance when clicked (if invalid)
- Is full-width on mobile, max 300px on desktop
- Optional: Temporarily shows "ADDED!" state for 1 second
- Optional: Sticks to bottom of screen on mobile devices
- Has appropriate touch target size and semantic labels

Test scenarios:
- Click with no selections → Shows "Please select a size" error
- Select size only → Shows "Please select a color" error
- Select both → Button enables, click shows success message
- Out of stock product → Button stays disabled with appropriate message
- Mobile view → Button is easy to tap and remains accessible while scrolling

---

## Prompt 7: Product Detail Sections (Tabs/Accordion)

### Context
I need additional information sections for product details, shipping info, and customer reviews. These should be organized in tabs or expandable sections.

### Requirements

**Create detail sections in `product_detail_page.dart`:**

#### 1. Choosing the Right Organizational Pattern

**Two Main Approaches:**

**Tabs (Better for Desktop):**
Tabs show all section titles horizontally at once. Users can click any tab to switch content. This works well on desktop where there's horizontal space. However, tabs can be cramped on mobile if you have many sections or long titles.

**Accordion/Expansion Panels (Better for Mobile):**
Each section has a header that expands to show content when clicked. Only one (or multiple) sections can be open at once. This stacks vertically, making it perfect for mobile. Users can see all section titles by scrolling down.

**Recommendation:**
Use a responsive approach - tabs on desktop (width > 900px), expansion panels on mobile. Or just use expansion panels everywhere for simplicity, as they work well on both.

#### 2. Product Details Section

**Content to Include:**

**Material Composition:**
Display the full material breakdown from `product.material`. For a hoodie, this might be "80% Cotton, 20% Polyester". Explain what this means - cotton provides softness and breathability, polyester adds durability and shape retention.

**Care Instructions:**
Show the care instructions from `product.care`. Format them as bullet points for clarity:
- Machine wash cold
- Tumble dry low
- Do not bleach
- Iron on low if needed

**Size Guide Link:**
Add a clickable text button or link labeled "SIZE GUIDE". When clicked, it could show a dialog or modal with a sizing chart. For now, just make it a non-functional TextButton with an icon (Icons.straighten or Icons.table_chart) to indicate it would open something.

**Country of Origin:**
Include where the product is made. For university merchandise, this is likely "United Kingdom" or "Imported". This information is required in many jurisdictions and builds trust.

**Layout Pattern:**
Use a two-column layout for specifications. Left column has bold labels ("Material:", "Care:", "Origin:"), right column has the values. Set a consistent width for the label column (120 pixels) so everything aligns nicely. Add 8-12 pixel spacing between rows.

#### 3. Shipping & Returns Section

**Delivery Options:**
List all shipping methods available:
- **Standard Delivery:** 3-5 working days, £3.99
- **Express Delivery:** 1-2 working days, £5.99
- **Click & Collect:** Next working day, FREE

Format this as bullet points or a table for easy scanning.

**Delivery Information:**
Explain the delivery process:
- Orders placed before 2pm ship same day
- Track your order via email notifications
- Delivery to UK addresses only (or international if applicable)
- Someone must be present to sign for delivery (if applicable)

**Returns Policy Summary:**
Provide a concise summary of return rights:
- 30-day return window from delivery
- Items must be unworn with tags attached
- Free returns via post or in-store
- Refund processed within 5-7 working days

**Link to Full Policy:**
Add a "View Full Returns Policy" link that would navigate to a dedicated policy page (non-functional for now).

**Why This Matters:**
Shipping costs and return policies are major factors in purchase decisions. Making this information easy to find reduces cart abandonment and buyer anxiety.

#### 4. Customer Reviews Section (Static UI Only)

**Purpose:**
Reviews build trust and provide social proof, even if they're not real yet. Create a realistic-looking review section using static data.

**Rating Summary:**
At the top, show an aggregate view:
- Large star rating (4.5/5)
- Total review count (127 reviews)
- Maybe a horizontal bar chart showing distribution (e.g., "95% would recommend")

**Individual Review Cards:**
Create 3-5 sample review cards, each containing:
- Reviewer name (first name + last initial: "Sarah M.")
- Star rating (individual review rating)
- Review text (2-3 sentences about their experience)
- Date (formatted like "Nov 15, 2025")
- Optional: Helpful votes ("24 people found this helpful")

**Review Content Examples:**
**5-Star Review:**
"Absolutely love this hoodie! The fabric is so soft and the fit is perfect. Great quality - definitely worth the money. Shows my uni pride!"

**4-Star Review:**
"Really nice quality hoodie. Sizing runs slightly large so I'd recommend going down a size if you want a fitted look. Love the design though!"

**5-Star Review:**
"Perfect for campus! Warm enough for cold lecture halls but not too heavy. The university logo is nicely done. Would definitely buy again."

**Write Review Button:**
Add a prominent button at the bottom: "WRITE A REVIEW". Style it as an outlined button in the brand purple color. It's non-functional but shows where this feature would go.

**Why Include Fake Reviews:**
It demonstrates the review system design and helps stakeholders visualize the feature. In a real implementation, these would connect to a backend API.

#### 5. Implementation - Accordion Approach

**ExpansionPanelList Setup:**
Create an ExpansionPanelList widget containing multiple ExpansionPanel items. Each panel has:
- A header builder that shows the section title
- A body containing the section content
- An isExpanded boolean to track if it's open

**State Management:**
Maintain a list of booleans tracking which panels are expanded. For three sections, initialize as `[false, false, false]`. When a panel is tapped, toggle its boolean via setState.

**Panel Headers:**
Make headers descriptive and clear:
- "Product Details & Specifications"
- "Shipping & Returns"
- "Customer Reviews (127)"

Include an icon (like Icons.info_outline, Icons.local_shipping, Icons.star_outline) before each title for visual interest.

**Panel Content:**
Keep content padded (16 pixels all around) and well-spaced. Use clear typography with headings for subsections.

#### 6. Implementation - Tabs Approach

**DefaultTabController Setup:**
Wrap your tab system in a DefaultTabController widget, specifying the number of tabs (3).

**TabBar:**
Create a TabBar with three tabs showing the section names. Style them to match your app:
- Active tab: Brand purple underline and text
- Inactive tabs: Grey text
- Consistent padding and sizing

**TabBarView:**
The TabBarView contains the content for each tab. Each section's content goes in its own container. Set a minimum height (300-400 pixels) so the content area doesn't jump when switching tabs.

**Styling:**
Add a subtle border or background color to separate the tab content area from the rest of the page.

### Deliverable

Product detail sections that:
- Organize additional information into logical categories (Details, Shipping, Reviews)
- Use either tabs (desktop) or expansion panels (mobile/both) for navigation
- Display complete product specifications with labeled rows
- Show shipping options, costs, and delivery timeframes clearly
- Summarize the returns policy with key points
- Include 3-5 realistic sample review cards with names, ratings, dates, and text
- Have a non-functional "Write Review" button
- Are well-formatted with consistent spacing and typography
- Make information easy to scan and find

Test by:
- Verifying all sections expand/switch correctly
- Checking content is readable and well-organized
- Ensuring reviews look realistic and varied
- Confirming shipping info is clear and complete
- Testing responsive behavior at different screen sizes

---

## Prompt 8: Related Products Section

### Context
I need a "You May Also Like" section at the bottom of the product detail page showing 4-6 related products to encourage additional purchases.

### Requirements

**Create related products section in `product_detail_page.dart`:**

#### 1. Product Selection Logic

**Simple Hardcoded Approach:**
For this UI-only implementation, just select other products from your `Product.sampleProducts` list. Filter out the current product (don't recommend the product they're already viewing) and take the first 4-6 remaining products.

The logic is simple: create a list where `product.id` doesn't match the current product's ID, then take 6 items from that filtered list.

**Advanced Logic (Optional Enhancement):**
If you want more realistic recommendations:
- Filter by same category (if viewing an Essential Range item, show other Essential Range items)
- Filter by similar price range (±£10 of current product)
- Randomize the selection so it varies each time

For now, the simple approach works fine and demonstrates the UI pattern.

#### 2. Section Header

**Visual Design:**
Create a large heading that stands out: "You May Also Like" or "Related Products" or "Complete the Look". Use a large font size (24 points), bold weight, and letter spacing (1.0) for emphasis.

Center the heading horizontally. Add generous spacing above it (48-60 pixels) to separate it from the detail sections, and spacing below (24-32 pixels) before the products grid.

**Alternative Titles:**
- "Customers Also Bought"
- "More University Merchandise"  
- "You Might Also Like"
- "Complete Your Collection"

Choose something that makes sense for your product categories.

#### 3. Product Card Design

**Each Card Shows:**

**Product Image:**
Display the first image from the product's image array. Use a square aspect ratio (1:1) for consistency. Make the image fill its container with BoxFit.cover to avoid distortion. Add error handling in case images don't load.

**Product Name:**
Show the product name below the image. Limit it to 2 lines with ellipsis overflow - if the name is too long, cut it off with "..." rather than letting it break the layout. Use a medium font size (14-15 points).

**Price Display:**
Show the product's display price prominently. If it's on sale, show both the sale price (bold, purple) and original price (smaller, grey, strikethrough). If not on sale, just show the regular price.

**Layout:**
Stack these vertically (image on top, name below, price at bottom) in a Column widget. Add small spacing (4-8 pixels) between elements.

#### 4. Grid Layout - Desktop

**Four Columns:**
On desktop (screen width > 900px), display products in a 4-column grid. This shows 4-6 products without requiring scrolling.

**Implementation:**
Use a GridView.builder or GridView.count with:
- `crossAxisCount: 4` (4 items per row)
- `crossAxisSpacing: 24` (horizontal spacing between cards)
- `mainAxisSpacing: 24` (vertical spacing if wrapping to second row)
- `childAspectRatio: 0.75` (slightly taller than wide to accommodate image + text)

**Set shrinkWrap and physics:**
Use `shrinkWrap: true` so the grid only takes the space it needs. Use `physics: NeverScrollableScrollPhysics()` since the whole page already scrolls - you don't want a scrollable grid inside a scrollable page.

#### 5. Horizontal Scroll - Mobile

**Why Horizontal Scroll:**
On mobile (width ≤ 900px), vertical space is precious. A grid would push the footer far down. Horizontal scrolling lets users swipe through products while keeping the section compact.

**Implementation:**
Use a ListView.builder with:
- `scrollDirection: Axis.horizontal` (scroll left/right instead of up/down)
- Fixed height container (280-300 pixels)
- Fixed width for each card (180-200 pixels)
- Right margin on each card (16 pixels) for spacing

Users can swipe left to see more products. This is intuitive on touch devices.

**Visual Indicator:**
The partially visible next product acts as a visual hint that more products exist to the right, encouraging users to scroll.

#### 6. Interaction - Navigation

**Card Tap Behavior:**
When a user taps a product card, navigate to that product's detail page. However, use `Navigator.pushReplacement` instead of `Navigator.push`.

**Why pushReplacement:**
If you use regular push, users can chain-click through related products endlessly, building a huge navigation stack. With pushReplacement, you replace the current product page with the new one. The back button still works (returns to wherever they came from), but the navigation stack doesn't grow infinitely.

**Passing the Product:**
Pass the new Product object as a navigation argument so the page can display that product's information.

#### 7. Hover Effects (Desktop)

**Purpose:**
On desktop, add visual feedback when users hover over product cards to indicate they're clickable.

**Effects to Consider:**
- Slight upward translation (move the card up by 4-8 pixels)
- Scale transformation (grow slightly to 1.05x)
- Shadow increase (increase elevation from 2 to 8)
- Image overlay (add slight white overlay to brighten the image)

**Implementation:**
Wrap cards in MouseRegion widgets to detect hover. Use AnimatedContainer to smoothly transition the effects over 200 milliseconds. Track hover state in a boolean variable.

Don't go overboard - subtle effects are more professional than dramatic animations.

#### 8. Empty State Handling

**If No Related Products:**
Check if your filtered product list is empty. If so, either:
- Hide the entire section (return an empty SizedBox)
- Show a message: "Check out our other collections" with a button to the main shop page
- Display products from a default category instead

For your app with hardcoded sample products, you should always have related products, but it's good practice to handle the edge case.

### Deliverable

A related products section that:
- Displays a clear section heading ("You May Also Like")
- Shows 4-6 product cards filtered from the sample products list
- Each card shows product image, name, and price (with sale price if applicable)
- Uses a 4-column grid on desktop (width > 900px)
- Uses horizontal scroll on mobile (width ≤ 900px)
- Navigates to the clicked product's detail page using pushReplacement
- Includes hover effects on desktop (subtle translation or scale)
- Handles edge cases (no related products, missing images)
- Is visually consistent with the rest of the page

Test by:
- Clicking product cards and verifying navigation works
- Checking the back button returns to the original source, not through every related product viewed
- Verifying the grid layout on desktop shows 4 columns with appropriate spacing
- Testing horizontal scroll on mobile works smoothly
- Hovering over cards on desktop shows visual feedback
- Confirming different screen sizes show appropriate layouts

---

## Prompt 9: Integration and Testing

### Context
I need to integrate all components, ensure proper navigation, test responsiveness, and handle edge cases.

### Requirements

**Final integration and testing of the product detail page:**

#### 1. Route Setup in main.dart

**Defining the Route:**
In your app's main.dart file, ensure there's a route entry for '/product-detail'. The route should extract the Product object from the navigation arguments and pass it to the ProductDetailPage widget.

Handle the case where no product is provided by defaulting to the first sample product. This prevents crashes during development when testing the route directly.

**Route Configuration:**
```dart
'/product-detail': (context) {
  final product = ModalRoute.of(context)!.settings.arguments as Product?;
  return ProductDetailPage(product: product ?? Product.sampleProducts.first);
}
```

#### 2. Navigation from Other Pages

**Updating Product Cards:**
Every place in your app that displays a product card needs to navigate to the detail page when tapped. This includes:
- Homepage product showcases
- Product listing page (product_page.dart)
- Collection pages (collection_page.dart, essential_range_page.dart)
- Sale page (sale_page.dart)

**Navigation Pattern:**
Wrap each product card in a GestureDetector or make the entire card a clickable widget. On tap, call Navigator.pushNamed with the '/product-detail' route and pass the Product object as arguments.

**Why Arguments:**
Passing the product as an argument allows the same ProductDetailPage widget to display different products. You don't need separate pages for each product.

#### 3. Responsive Testing - Desktop

**Large Screens (>900px width):**
Test at various desktop resolutions (1920x1080, 1366x768, 2560x1440). Verify:

**Layout Verification:**
The image gallery and info panel should appear side-by-side in a Row with appropriate width distribution (60/40 split). The gallery should have large, clear images with thumbnails in a grid below. The info panel should have comfortable width (not stretched across the whole screen).

**Spacing and Alignment:**
Check that all elements have consistent spacing. Buttons and text should align properly. Nothing should touch the edges of the screen - there should be comfortable padding.

**Hover States:**
All interactive elements (buttons, links, product cards) should show hover effects. The cursor should change to a pointer over clickable items.

**Text Readability:**
Product descriptions should be constrained to readable widths (600px max). Long lines of text are hard to read.

#### 4. Responsive Testing - Mobile

**Small Screens (<600px width):**
Test at common mobile resolutions (375x667 iPhone SE, 390x844 iPhone 13, 360x800 Android). Verify:

**Layout Switching:**
The two-column layout should collapse to a single column. Image gallery on top (full width), product information below it. Related products should switch to horizontal scroll.

**Touch Targets:**
All buttons, selectors, and links should be large enough to tap easily (minimum 48x48 pixels). Test actually tapping them - your thumb shouldn't miss or hit the wrong target.

**Scrolling Behavior:**
The entire page should scroll smoothly. If using a sticky Add to Cart button, ensure content isn't hidden behind it.

**No Horizontal Scroll:**
The page should never require horizontal scrolling. All content should fit within the screen width. Check at very narrow widths (320px) to ensure nothing breaks.

**Text Sizing:**
All text should be readable without zooming. Very small text (under 14px) is hard to read on mobile.

#### 5. Edge Case Handling

**Missing Product Data:**
Test what happens when the product object is null. Your error screen should display with a clear message and working back button. Don't show any product-specific content - it'll cause errors.

**Out of Stock Products:**
Create a sample product with `inStock: false`. Verify the Add to Cart button is disabled and shows an appropriate message. The availability badge should show red "Out of Stock".

**Single Image Products:**
Test a product with only one image. The thumbnail gallery should either hide completely or show just that one image. Don't show empty thumbnail slots.

**Long Product Names:**
Test with a product that has a very long name (50+ characters). Verify it doesn't break the layout - it should wrap to multiple lines gracefully.

**Empty Descriptions:**
What happens if a product has a very short description or empty description? The spacing should still look reasonable.

**No Related Products:**
If your filtering logic returns zero related products, the section should hide entirely or show an appropriate message.

#### 6. Performance Checks

**Image Loading:**
Check that images load smoothly without causing layout shifts. Use the errorBuilder to handle failed image loads gracefully.

**Smooth Animations:**
Transitions (image gallery changes, button state changes, hover effects) should be smooth without jank. If you notice stuttering, consider reducing animation complexity or optimizing images.

**Memory Usage:**
In debug mode, check that navigating to different products doesn't cause memory leaks. The old product's data should be garbage collected.

#### 7. Cross-Browser Testing (Web)

If building for web, test in:
- Chrome/Edge (Chromium-based)
- Firefox
- Safari (if you have access to macOS)

Check that:
- All layouts render correctly
- Images display properly
- Hover effects work
- Navigation works
- Responsive breakpoints trigger at correct widths

**Common web-specific issues:**
- Image paths might differ (web needs pub_get assets configured correctly)
- Some fonts might not load
- Touch events might not work on desktop browsers

#### 8. Console Error Checking

**Run the app in debug mode and check the console:**
- No red error messages should appear
- No overflow warnings (yellow/black stripes in UI)
- No deprecated API usage warnings
- No "setState called after dispose" errors
- Images should load without errors

**Common errors to fix:**
- Wrong image paths → verify assets are listed in pubspec.yaml
- Navigation errors → check route names match exactly
- Null reference errors → add null checks where needed
- Layout overflow → add proper Expanded/Flexible widgets or scrolling

#### 9. User Flow Testing

**Complete Purchase Flow:**
Simulate a real user's journey:
1. Start from homepage
2. Click a product card
3. View product details
4. Select a size
5. Select a color  
6. Adjust quantity
7. Click Add to Cart
8. See success message
9. Click a related product
10. Repeat on new product
11. Use back button to return to starting point

Verify each step works smoothly with no errors or unexpected behavior.


### Deliverable

A fully integrated, tested product detail page that:
- Loads correctly when navigated to from any part of the app
- Passes all responsive tests (desktop, tablet, mobile)
- Handles all edge cases gracefully (missing data, out of stock, etc.)
- Shows no console errors or warnings
- Performs smoothly with no jank or stuttering
- Works across different browsers (if building for web)
- Provides good accessibility for screen readers and keyboard users
- Successfully completes the full user purchase flow

**Final Checklist:**
- [ ] Route is defined in main.dart
- [ ] Navigation works from all product cards throughout the app
- [ ] Desktop layout (>900px) displays correctly
- [ ] Mobile layout (<600px) displays correctly
- [ ] Tablet layout (600-900px) displays correctly
- [ ] All touch targets are adequate size (48x48px minimum)
- [ ] No horizontal scrolling on mobile
- [ ] Missing product shows error screen
- [ ] Out of stock products disable Add to Cart
- [ ] Single image products don't show empty thumbnails
- [ ] Long product names wrap gracefully
- [ ] Related products navigate correctly
- [ ] Back button returns to previous page
- [ ] No console errors in debug mode
- [ ] Images load correctly
- [ ] Animations are smooth
- [ ] Hover effects work on desktop
- [ ] Screen reader announces content correctly
- [ ] Keyboard navigation works
- [ ] Color contrast is sufficient

Once all checklist items pass, the product detail page is complete and ready for deployment.

---