# Union Shop - Requirements Document

## Project Overview
A Flutter-based e-commerce application for the University of Portsmouth Students' Union shop, focusing on functionality over visual design.

## Assessment Criteria (40% Total)

### 1. Static Homepage (5%)
**Status: ✅ COMPLETE**

- [x] Homepage layout with widgets
- [x] Static content with hardcoded data
- [x] Mobile-responsive view
- [x] Hero banner with promotional content
- [x] Product showcases (Essential Range, Signature Range, Portsmouth City Collection)
- [x] Call-to-action buttons

**Files:** `lib/main.dart`

---

### 2. About Us Page (5%)
**Status: ✅ COMPLETE**

- [x] Separate page from homepage
- [x] Company/organization information
- [x] Mission statement
- [x] Contact information
- [x] Accessible via navigation

**Files:** `lib/views/about_page.dart`

---

### 3. Footer (4%)
**Status: ✅ COMPLETE**

- [x] Present in at least one page
- [x] Opening hours information
- [x] Help and information links (dummy)
- [x] Newsletter subscription UI
- [x] Social media icons
- [x] Payment badges
- [x] Copyright notice

**Files:** `lib/widgets/footer.dart`, `lib/main.dart`

---

### 4. Dummy Collections Page (5%)
**Status: ✅ COMPLETE**

- [x] Displays various collections of products
- [x] Hardcoded data
- [x] Multiple collections visible:
  - Essential Range
  - Signature Range
  - Portsmouth City Collection
  - Merchandise
  - Pride Collection
- [x] Responsive grid layout
- [x] Product cards with images and prices

**Files:** `lib/views/product_page.dart`

---

### 5. Dummy Collection Page (5%)
**Status: ✅ COMPLETE**

- [x] Single collection view with filters
- [x] Dropdowns for sorting
- [x] Filter widgets (price range, size, color)
- [x] Products grid
- [x] Hardcoded data
- [x] Mobile-responsive filters (modal on mobile)
- [x] Filter chips and checkboxes

**Files:** `lib/views/collection_page.dart`, `lib/views/essential_range_page.dart`

---

### 6. Dummy Product Page (4%)
**Status: ❌ INCOMPLETE**

**Requirements:**
- [ ] Individual product detail page
- [ ] Product images (multiple views/gallery)
- [ ] Product title and description
- [ ] Price display
- [ ] Size dropdown selector
- [ ] Color dropdown/selector
- [ ] Quantity selector
- [ ] "Add to Cart" button
- [ ] Product specifications/details
- [ ] Related products section (optional)

**Priority:** HIGH
**Estimated Time:** 2-3 hours

---

### 7. Sale Collection (4%)
**Status: ⚠️ PARTIAL**

**Current:**
- [x] Sale page route exists
- [x] Promotional messaging on homepage

**Missing:**
- [ ] Dedicated sale products page
- [ ] Products with original prices crossed out
- [ ] Sale prices highlighted
- [ ] Promotional banners
- [ ] "SALE" badges on products
- [ ] Percentage discount displays

**Priority:** MEDIUM
**Estimated Time:** 1-2 hours

**Files:** `lib/views/sale_page.dart` (needs completion)

---

### 8. Authentication UI (3%)
**Status: ❌ INCOMPLETE**

**Requirements:**
- [ ] Login page with form
  - [ ] Email/username input field
  - [ ] Password input field
  - [ ] "Remember me" checkbox
  - [ ] Login button
  - [ ] "Forgot password?" link
- [ ] Signup page with form
  - [ ] Name/email input fields
  - [ ] Password input field
  - [ ] Confirm password field
  - [ ] Terms & conditions checkbox
  - [ ] Sign up button
- [ ] Toggle between login/signup
- [ ] Social login buttons (UI only)

**Priority:** MEDIUM
**Estimated Time:** 1-2 hours

---

### 9. Static Navbar (5%)
**Status: ✅ COMPLETE**

- [x] Top navigation bar on desktop
- [x] Logo/branding
- [x] Navigation links (Home, Shop, The Print Shack, SALE!, About)
- [x] Dropdown menus for Shop and Print Shack
- [x] Search, account, and cart icons
- [x] Collapses to hamburger menu on mobile
- [x] Mobile menu with expandable sections
- [x] Active page highlighting

**Files:** `lib/main.dart`, `lib/widgets/header.dart`

---

## Project Structure

```
lib/
├── main.dart                          # ✅ App entry point, HomeScreen, navbar
├── views/
│   ├── about_page.dart                # ✅ About Us page
│   ├── product_page.dart              # ✅ Collections page (all products)
│   ├── collection_page.dart           # ✅ Single collection with filters
│   ├── essential_range_page.dart      # ✅ Essential Range collection
│   ├── sale_page.dart                 # ⚠️ Needs completion
│   ├── personalisation_page.dart      # ✅ Print Shack personalisation
│   ├── print_shack_about.dart         # ✅ Print Shack about
│   └── product_detail_page.dart       # ❌ TO CREATE
├── widgets/
│   ├── header.dart                    # ✅ Reusable header/navbar
│   └── footer.dart                    # ✅ Reusable footer
└── auth/
    ├── login_page.dart                # ❌ TO CREATE
    └── signup_page.dart               # ❌ TO CREATE (optional, can be same page)
```

---

## Summary: What's Missing

### Critical (Required for 40%)
1. **Product Detail Page (4%)** - Individual product view
2. **Sale Collection Page (4%)** - Complete sale products display
3. **Authentication UI (3%)** - Login/signup forms

### Total Missing: 11% out of 40%
### Current Completion: 29% out of 40% (72.5%)

---

## Priority Order

1. **Product Detail Page** (4%) - Most important missing feature
2. **Authentication UI** (3%) - Required for assessment
3. **Sale Collection** (4%) - Complete the existing partial implementation

---

## Technical Notes

- Use hardcoded data for all product information
- Widgets/buttons do not need to be functional (except navigation)
- Focus on UI/layout over backend functionality
- Mobile responsiveness is important
- Use placeholder images or AI-generated images
- No actual authentication/database required