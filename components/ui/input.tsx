import * as React from 'react';
import { cn } from '@/lib/utils';

// Interface extending input HTML attributes, allowing additional props if needed
export interface InputProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  // You can add custom props here if required
  // For example, you can define a `label` prop
  label?: string; // Added a sample prop to avoid empty interface error
}

// Forwarding ref and defining the Input component
const Input = React.forwardRef<HTMLInputElement, InputProps>(
  ({ className, type = 'text', label, ...props }, ref) => {
    return (
      <div>
        {label && <label className="text-sm font-medium">{label}</label>}
        <input
          type={type}
          className={cn(
            'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
            className,
          )}
          ref={ref}
          {...props} // Spread other input props
        />
      </div>
    );
  },
);
Input.displayName = 'Input'; // Setting the display name for the component

export { Input }; // Exporting the Input component
