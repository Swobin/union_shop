# Union Shop - Requirements Document

## Project Overview
A Flutter-based e-commerce application for the University of Portsmouth Students' Union shop, focusing on functionality over visual design.


## Project Structure

```
lib/
├── main.dart                          # ✅ App entry point, HomeScreen, navbar
├── views/
│   ├── about_page.dart                # ✅ About Us page
│   ├── product_page.dart              # ✅ Collections page (all products)
│   ├── collection_page.dart           # ✅ Single collection with filters
│   ├── essential_range_page.dart      # ✅ Essential Range collection
│   ├── sale_page.dart                 # ✅ Sale products page
│   ├── personalisation_page.dart      # ✅ Print Shack personalisation
│   ├── print_shack_about.dart         # ✅ Print Shack about
│   ├── auth_page.dart                 # ⚠️ Partial (needs completion)
│   └── product_detail_page.dart       # ❌ TO CREATE
├── widgets/
│   ├── header.dart                    # ✅ Reusable header/navbar
│   └── footer.dart                    # ✅ Reusable footer
└── models/
    └── product.dart                   # ❌ TO CREATE (optional)
```

---

## Summary: What's Missing

### Critical (Required for 40%)
1. **Product Detail Page (4%)** - Individual product view
2. **Authentication UI (3%)** - Login/signup forms (currently partial)

### Total Missing: 7% out of 40%
### Current Completion: 33% out of 40% (82.5%)

---

## Priority Order

1. **Product Detail Page** (4%) - Most important missing feature
2. **Authentication UI** (3%) - Complete the existing partial implementation

---

## Technical Notes

- Use hardcoded data for all product information
- Widgets/buttons do not need to be functional (except navigation)
- Focus on UI/layout over backend functionality
- Mobile responsiveness is important
- Use placeholder images or AI-generated images
- No actual authentication/database required

---

# Product Detail Page - Feature Requirements

## 1. Feature Description and Purpose

### Overview
The Product Detail Page is a comprehensive view for individual products in the Union Shop e-commerce application. It serves as the primary interface where customers can view detailed product information, select variants (size, color), and add items to their cart.

### Purpose
- Display complete product information including images, descriptions, pricing, and specifications
- Enable users to select product variants (size, color) before purchase
- Provide a clear path to add products to cart
- Show related/recommended products to encourage additional purchases
- Create trust through detailed product information and customer reviews (UI only)

### Business Value
- **Increases conversion rates** by providing all necessary purchase information
- **Reduces returns** by clearly showing product details and sizing
- **Boosts average order value** through related product recommendations
- **Builds customer confidence** with detailed specifications and reviews

---

## 2. User Stories

### User Story 1: Browse Product Details
**As a** prospective customer  
**I want to** view detailed information about a product  
**So that** I can make an informed purchase decision

**Acceptance Criteria:**
- Product title is prominently displayed
- High-quality product images are visible
- Price is clearly shown (including sale price if applicable)
- Detailed product description is available
- Material/fabric information is displayed
- Care instructions are provided

---

### User Story 2: Select Product Variants
**As a** customer ready to purchase  
**I want to** select my preferred size and color  
**So that** I receive the exact product I want

**Acceptance Criteria:**
- Size dropdown shows all available sizes (XS, S, M, L, XL, XXL)
- Color selector displays available colors with visual swatches
- Out-of-stock variants are clearly marked but still visible
- Selected options are highlighted
- Product image updates when color is changed (optional enhancement)

---

### User Story 3: Adjust Quantity
**As a** bulk purchaser or society representative  
**I want to** select the quantity of items I need  
**So that** I can order multiple items at once

**Acceptance Criteria:**
- Quantity selector with +/- buttons is available
- Manual number input is supported
- Minimum quantity is 1
- Maximum quantity limit is enforced (e.g., 99)
- Total price updates based on quantity

---

### User Story 4: Add to Cart
**As a** customer who has selected my preferences  
**I want to** add the product to my cart  
**So that** I can continue shopping or proceed to checkout

**Acceptance Criteria:**
- "Add to Cart" button is prominently displayed
- Button is disabled if required selections (size/color) are not made
- Visual feedback is provided when button is clicked
- Success message/toast appears after adding to cart
- Cart icon updates with item count (UI indication)

---

### User Story 5: View Product Gallery
**As a** detail-oriented shopper  
**I want to** see multiple product images from different angles  
**So that** I can better understand the product appearance

**Acceptance Criteria:**
- Main product image is large and clear
- Thumbnail images show different views (front, back, detail, lifestyle)
- Clicking thumbnails updates the main image
- Images can be zoomed (optional)
- Gallery supports swipe gestures on mobile

---

### User Story 6: Discover Related Products
**As a** customer viewing a product  
**I want to** see similar or complementary items  
**So that** I can find additional products I might like

**Acceptance Criteria:**
- "You May Also Like" section is displayed
- At least 4 related products are shown
- Each related product shows image, title, and price
- Clicking a related product navigates to its detail page
- Products are relevant to the current item

---

### User Story 7: Access on Mobile
**As a** mobile shopper  
**I want to** view product details on my phone  
**So that** I can shop on-the-go

**Acceptance Criteria:**
- Page is fully responsive on mobile devices
- Images are optimized for mobile viewing
- Dropdowns/selectors are touch-friendly
- All information is accessible without horizontal scrolling
- "Add to Cart" button is always visible (sticky or prominent)

---

## 3. Acceptance Criteria (Feature Completion)

### Visual Design Requirements

#### Layout Structure
- [ ] **Header Section**
  - Standard navigation header (AppHeader widget)
  - Breadcrumb navigation (Home > Shop > Collection > Product Name)

- [ ] **Product Main Section** (Two-column on desktop, stacked on mobile)
  - Left column: Product image gallery
  - Right column: Product information and purchase options

- [ ] **Product Gallery**
  - Large main image display (minimum 500x500px)
  - 4-6 thumbnail images below or beside main image
  - Smooth image transitions
  - Placeholder images if actual images unavailable

- [ ] **Product Information Panel**
  - Product title (H1, bold, 24-28px)
  - Price display (large, prominent)
  - Sale price with original price struck through (if applicable)
  - Star rating display (static 4.5/5 stars for UI)
  - Product description (2-3 paragraphs)
  - SKU/Product code
  - Availability status (In Stock/Low Stock/Out of Stock)

#### Variant Selection
- [ ] **Size Selector**
  - Dropdown or button group format
  - Options: XS, S, M, L, XL, XXL
  - Clear label "Select Size:"
  - Default state prompts selection
  - Visual indication of selected size

- [ ] **Color Selector**
  - Color swatches or dropdown
  - At least 3 color options (e.g., Navy, White, Grey)
  - Clear label "Select Color:"
  - Selected color highlighted
  - Color names displayed

- [ ] **Quantity Selector**
  - Number input with +/- buttons
  - Default value: 1
  - Range: 1-99
  - Responsive to button clicks and manual input

#### Call-to-Action
- [ ] **Add to Cart Button**
  - Full-width or prominent size
  - University brand color (purple #4d2963)
  - Disabled state when selections incomplete
  - Hover effect
  - Loading state (optional)

- [ ] **Wishlist/Save Button** (optional enhancement)
  - Heart icon or "Save for Later"
  - Toggle state (saved/unsaved)

#### Additional Information Tabs/Sections
- [ ] **Product Details**
  - Material composition
  - Sizing guide link
  - Care instructions
  - Country of origin

- [ ] **Shipping Information**
  - Delivery options
  - Estimated delivery time
  - Click & Collect option
  - Returns policy summary

- [ ] **Customer Reviews** (UI only)
  - Star rating summary
  - 2-3 sample reviews with:
    - Reviewer name
    - Star rating
    - Review text
    - Date
  - "Write a Review" button (non-functional)

#### Related Products Section
- [ ] **"You May Also Like" / "Related Products"**
  - 4-6 product cards
  - Each card shows:
    - Product image
    - Product name
    - Price
  - Horizontal scroll on mobile
  - Grid layout on desktop
  - Click navigates to that product's detail page

#### Footer
- [ ] Standard AppFooter widget
- [ ] Consistent across all pages

---

### Technical Requirements

#### Responsive Behavior
- [ ] **Desktop (>900px)**
  - Two-column layout (60/40 split for gallery/info)
  - Thumbnails displayed in grid below main image
  - Related products in 4-column grid

- [ ] **Tablet (600-900px)**
  - Two-column layout maintained
  - Thumbnails in horizontal scroll
  - Related products in 2-column grid

- [ ] **Mobile (<600px)**
  - Single-column stacked layout
  - Gallery full-width at top
  - Product info below
  - Sticky "Add to Cart" button at bottom
  - Related products in horizontal scroll

#### Navigation
- [ ] Route defined in `main.dart` (`/product-detail`)
- [ ] Accessible from:
  - Product cards on homepage
  - Product listings page
  - Collection pages
  - Related products section
- [ ] Back button returns to previous page
- [ ] Breadcrumb navigation functional

#### Data Structure
```dart
// Example hardcoded product data
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? salePrice;
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;
  final String material;
  final String care;
  final bool inStock;
  final double rating;
  final int reviewCount;
}
```

#### State Management
- [ ] Selected size state
- [ ] Selected color state
- [ ] Quantity state
- [ ] Current main image state
- [ ] Add to cart feedback state

---

### Functional Requirements (UI Only - No Backend)

#### User Interactions
- [ ] **Size Selection**
  - Click/tap updates selected size
  - Visual feedback on selection
  - Validates selection before allowing Add to Cart

- [ ] **Color Selection**
  - Click/tap updates selected color
  - Visual feedback on selection
  - (Optional) Updates main image to show selected color

- [ ] **Quantity Adjustment**
  - Plus button increments quantity
  - Minus button decrements (minimum 1)
  - Manual input accepted within range
  - Invalid input shows error/reverts to last valid value

- [ ] **Add to Cart**
  - Validates all required selections
  - Shows error message if selections incomplete
  - Shows success toast/snackbar on click
  - Button briefly shows "Added!" state
  - (Does not actually add to cart - UI only)

- [ ] **Image Gallery**
  - Click thumbnail updates main image
  - Smooth transition/fade effect
  - Mobile: Swipe gesture support (optional)

- [ ] **Related Products**
  - Click product card navigates to that product's detail page
  - Hover effect on desktop
  - Mobile: Horizontal scroll enabled

---

### Content Requirements

#### Hardcoded Product Examples
Create at least **3 sample products** with complete data:

1. **Essential Zip Hoodie**
   - Price: £14.99 (was £20.00)
   - Sizes: XS, S, M, L, XL, XXL
   - Colors: Navy, White, Grey
   - Material: 80% Cotton, 20% Polyester
   - Images: 4-5 different views

2. **Signature T-Shirt**
   - Price: £14.99
   - Sizes: XS, S, M, L, XL, XXL
   - Colors: Navy, White, Purple
   - Material: 100% Cotton
   - Images: 4-5 different views

3. **Portsmouth City Hoodie**
   - Price: £29.99
   - Sizes: S, M, L, XL, XXL
   - Colors: Navy, Grey
   - Material: 85% Cotton, 15% Polyester
   - Images: 4-5 different views

#### Text Content
- [ ] Product descriptions (2-3 paragraphs each)
- [ ] Sizing guide text
- [ ] Care instructions
- [ ] Shipping information
- [ ] Returns policy summary
- [ ] Sample customer reviews (3-5 per product)

---

### Testing Checklist

#### Desktop Testing
- [ ] Page loads without errors
- [ ] All images display correctly
- [ ] Layout is properly aligned
- [ ] All dropdowns/selectors functional
- [ ] Buttons show hover states
- [ ] Add to Cart validation works
- [ ] Navigation links work
- [ ] Related products clickable

#### Mobile Testing
- [ ] Page is fully responsive
- [ ] No horizontal scroll required
- [ ] Images scale appropriately
- [ ] Touch targets are adequate size (min 44x44px)
- [ ] Dropdowns work on mobile
- [ ] Add to Cart button accessible
- [ ] Gallery swipe works (if implemented)

#### Cross-Browser Testing
- [ ] Chrome/Edge
- [ ] Firefox
- [ ] Safari (if accessible)
- [ ] Mobile browsers (Chrome Mobile, Safari iOS)

---

## 4. Implementation Subtasks

### Subtask 1: Create Product Detail Page Structure
**Estimated Time:** 30-45 minutes

**Tasks:**
- [ ] Create `lib/views/product_detail_page.dart`
- [ ] Add route to `main.dart`
- [ ] Implement basic StatefulWidget
- [ ] Add AppHeader and AppFooter
- [ ] Create responsive layout structure (Column for mobile, Row for desktop)

**Deliverable:** Empty product detail page with header/footer, accessible via navigation

---

### Subtask 2: Implement Product Data Model
**Estimated Time:** 20-30 minutes

**Tasks:**
- [ ] Create `lib/models/product.dart` (optional, or inline in page)
- [ ] Define Product class with all properties
- [ ] Create 3 sample products with complete data
- [ ] Add product images (placeholders or AI-generated)

**Deliverable:** Hardcoded product data ready to display

---

### Subtask 3: Build Product Image Gallery
**Estimated Time:** 45-60 minutes

**Tasks:**
- [ ] Create main image display widget
- [ ] Create thumbnail gallery (Row/Grid)
- [ ] Implement thumbnail click to update main image
- [ ] Add image transitions/animations
- [ ] Make gallery responsive (different layouts for mobile/desktop)
- [ ] Add placeholder/error handling for images

**Deliverable:** Functional image gallery with thumbnail selection

---

### Subtask 4: Build Product Information Panel
**Estimated Time:** 30-45 minutes

**Tasks:**
- [ ] Display product title
- [ ] Display price (with sale price if applicable)
- [ ] Add star rating display (static UI)
- [ ] Display product description
- [ ] Add SKU/product code
- [ ] Add availability status badge
- [ ] Make panel responsive

**Deliverable:** Complete product information display

---

### Subtask 5: Implement Variant Selectors
**Estimated Time:** 60-90 minutes

**Tasks:**
- [ ] Create size selector dropdown/button group
- [ ] Create color selector with swatches
- [ ] Implement quantity selector with +/- buttons
- [ ] Add state management for selections
- [ ] Add validation logic
- [ ] Style selectors to match brand
- [ ] Add selection feedback (highlighting, etc.)
- [ ] Handle mobile touch interactions

**Deliverable:** Functional variant selection UI

---

### Subtask 6: Implement Add to Cart Button
**Estimated Time:** 30-45 minutes

**Tasks:**
- [ ] Create prominent Add to Cart button
- [ ] Implement validation (size/color selected)
- [ ] Add disabled state styling
- [ ] Create success snackbar/toast
- [ ] Add hover/press animations
- [ ] Make button responsive (sticky on mobile optional)

**Deliverable:** Interactive Add to Cart button with feedback

---

### Subtask 7: Add Product Details Sections
**Estimated Time:** 45-60 minutes

**Tasks:**
- [ ] Create tabbed or accordion sections for:
  - Product Details
  - Shipping Info
  - Reviews (UI only)
- [ ] Add material/care information
- [ ] Add sizing guide link/modal
- [ ] Create sample review cards
- [ ] Make sections responsive

**Deliverable:** Complete product detail sections

---

### Subtask 8: Build Related Products Section
**Estimated Time:** 30-45 minutes

**Tasks:**
- [ ] Create "You May Also Like" section
- [ ] Display 4-6 related product cards
- [ ] Implement navigation to related products
- [ ] Make section responsive (horizontal scroll on mobile)
- [ ] Add hover effects

**Deliverable:** Functional related products section

---

### Subtask 9: Testing and Polish
**Estimated Time:** 30-45 minutes

**Tasks:**
- [ ] Test all interactions
- [ ] Test responsive behavior at different breakpoints
- [ ] Test navigation from various pages
- [ ] Fix any layout issues
- [ ] Optimize performance (if needed)
- [ ] Add final polish (spacing, alignment, etc.)

**Deliverable:** Production-ready product detail page

---

## 5. Total Estimated Time

| Subtask | Time Estimate |
|---------|---------------|
| 1. Page Structure | 30-45 min |
| 2. Data Model | 20-30 min |
| 3. Image Gallery | 45-60 min |
| 4. Info Panel | 30-45 min |
| 5. Variant Selectors | 60-90 min |
| 6. Add to Cart | 30-45 min |
| 7. Detail Sections | 45-60 min |
| 8. Related Products | 30-45 min |
| 9. Testing & Polish | 30-45 min |
| **TOTAL** | **5-7.5 hours** |

---

## 6. Files to Create/Modify

### New Files
- `lib/views/product_detail_page.dart` - Main product detail page
- `lib/models/product.dart` - Product data model (optional)

### Files to Modify
- `lib/main.dart` - Add route for product detail page (already exists)
- `lib/views/product_page.dart` - Ensure navigation to product detail (already working)
- `lib/views/collection_page.dart` - Ensure navigation to product detail
- `lib/views/essential_range_page.dart` - Ensure navigation to product detail

---

## 7. Success Metrics

The Product Detail Page feature is **COMPLETE** when:

✅ All 9 subtasks are finished  
✅ All acceptance criteria checkboxes are ticked  
✅ All 3 sample products display correctly  
✅ Page is fully responsive on mobile, tablet, and desktop  
✅ All user interactions work as expected  
✅ Navigation to/from product detail works  
✅ Related products section is functional  
✅ No console errors or warnings  
✅ Code is clean and well-commented  

---

## 8. Notes and Considerations

### Design Philosophy
- **Prioritize clarity** over fancy animations
- **Mobile-first approach** - ensure mobile experience is solid
- **Match existing brand colors** (purple #4d2963)
- **Use existing widgets** (AppHeader, AppFooter) for consistency

### Technical Considerations
- Use StatefulWidget for managing selections
- Consider using Provider/setState for state management
- Images can be placeholders or AI-generated
- All functionality is UI only - no actual cart/checkout

### Optional Enhancements (If Time Permits)
- Image zoom on hover/click
- Color change updates product image
- Size guide modal/popup
- Breadcrumb navigation
- Sticky Add to Cart on scroll (mobile)
- Social sharing buttons
- 360° product view (advanced)

---

**Document Version:** 3.0  
**Last Updated:** December 2, 2025  
**Status:** Ready for Implementation