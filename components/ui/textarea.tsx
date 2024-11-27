import * as React from 'react';
import { cn } from '@/lib/utils';

// Interface extending textarea HTML attributes, allowing additional props if needed
export interface TextareaProps
  extends React.TextareaHTMLAttributes<HTMLTextAreaElement> {
  // You can add custom props here if required
  // For example, you can define a `label` prop
  label?: string; // Added a sample prop to avoid empty interface error
}

// Forwarding ref and defining the Textarea component
const Textarea = React.forwardRef<HTMLTextAreaElement, TextareaProps>(
  ({ className, label, ...props }, ref) => {
    return (
      <div>
        {label && <label className="text-sm font-medium">{label}</label>}
        <textarea
          className={cn(
            'flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
            className,
          )}
          ref={ref}
          {...props}
        />
      </div>
    );
  },
);
Textarea.displayName = 'Textarea'; // Setting the display name for the component

export { Textarea }; // Exporting the Textarea component
