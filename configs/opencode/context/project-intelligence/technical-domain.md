<!-- Context: project-intelligence/technical | Priority: critical | Version: 1.1 | Updated: 2026-02-27 -->

# Technical Domain

**Concept**: This project uses a NestJS + Angular stack with PostgreSQL, prioritizing clean architecture patterns and strong testability. The goal is maintainable, modular code with clear domain boundaries.

## Key Points
- Backend: NestJS with DI and use-case oriented application layer
- Frontend: Angular with OnPush change detection
- Data: PostgreSQL with snake_case schema naming
- Tooling: ESLint/Prettier and Jest for testing
- Architecture: Hexagonal + DDD mindset where practical

## Quick Example
```ts
@Controller()
export class FindAllBrandsController {
  constructor(private readonly findAllBrandsUseCase: FindAllBrandsUseCase) {}

  @Get()
  findAll() {
    return this.findAllBrandsUseCase.execute()
  }
}
```

**Reference**: https://docs.nestjs.com/controllers

## Primary Stack
| Layer | Technology | Notes |
|-------|------------|------|
| Backend | NestJS | DI-first, use-case oriented |
| Frontend | Angular | OnPush, template-driven UI |
| Language | TypeScript | Strict types, shared DTOs |
| Database | PostgreSQL | snake_case schema |
| Styling | Tailwind | utility-first CSS |
| Runtime/Infra | Docker | containerized dev/prod |
| Libraries | RxJS, Jest | reactive + testing |

## Code Patterns
### API Endpoint
```ts
@Controller()
export class FindAllBrandsController {
  @Get()
  @ApiResponse({ status: HttpStatus.OK, type: FindAllBrandsResponseDto, isArray: true })
  findAll() {
    return this.findAllBrandsUseCase.execute()
  }
}
```

### Component
```ts
@Component({
  selector: 'app-brands',
  changeDetection: ChangeDetectionStrategy.OnPush,
  template: `...`,
})
export class BrandsComponent {
  protected readonly brandsService = inject(BrandsService)
}
```

## Naming Conventions
| Type | Convention | Example |
|------|-----------|---------|
| Files | kebab-case + context | `save-user.service.ts`, `brand.component.ts` |
| Components | PascalCase + context | `SaveUserService`, `BrandsComponent` |
| Functions | camelCase | `findAllBrands()` |
| Database | snake_case | `brand_assets` |

## Code Standards
- Prioritize dependency injection
- Focus on testing principles
- Follow SOLID principles
- Use hexagonal architecture + DDD mindset where appropriate
- Set best practices early with ESLint/Prettier (or similar)

## Security Requirements
- Never hard-code private credentials or tokens
- Be strict in error responses; avoid leaking internal info

## 📂 Codebase References
**Frontend**: `apps/web/src/` or `frontend/src/` — Angular components & UI
**Backend**: `apps/api/src/` or `backend/src/` — NestJS controllers & use-cases
**Shared**: `libs/` or `shared/` — DTOs, contracts, common utilities

## Related Files
- `business-domain.md` — Business goals and user context
- `business-tech-bridge.md` — Business → technical mapping
- `decisions-log.md` — Decision rationale and tradeoffs
